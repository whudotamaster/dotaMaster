package com.neusoft.services.impl;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.RowSet;
import javax.tools.Tool;

import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;
public class Ac06ServicesImpl extends JdbcServicesSupport 
{
	//是否能够购买饰品的判断
	private boolean allowPurchase(Object aac601)throws Exception
	{
		//1,根据饰品ID查询饰品其他信息
		Map<String, Object> acc=this.findAccessories(aac601);
		
		//没有库存购买失败
		if(Integer.parseInt(acc.get("aac606").toString())==0)
		{
			this.setMessage("商品库存不足");
			return false;
		}
		
		//2,根据用户ID 查询用户余额
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		
		//用户金币不足,购买失败
		if(money<Double.parseDouble(acc.get("aac605").toString()))
		{
			this.setMessage("用户金额不足");
			return false;
		}
		return true;
	}
	
	
	//为批量购买和单件购买准备的修改数据的事务代码,注---未执行事务
	private void buyAccessories(Object aac601)throws Exception
    {
			
		Map<String, Object> acc=this.findAccessories(aac601);
		
		//3,减少用户余额,由于是事务性操作 只能重新编写sql语句
    	StringBuilder sql1=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106-?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			acc.get("aac605"),
    			this.get("aab101")
    	};
		this.apppendSql(sql1.toString(), args);
		
		//4,更新饰品库存
		String sql2="update ac06 set aac606=aac606-1 where aac601=?";
		this.apppendSql(sql2, aac601);
		
		//5,插入待发货列表
		StringBuilder sql3=new StringBuilder()
    			.append("insert into ad04(aac601,aab101,aad402,aad403,aad404,aad405) ")
    			.append("          values(?,?,?,?,?,current_timeStamp)")
    			;
		Object args3[]=
			{
				aac601,
				this.get("aab101"),
				this.get("aad402"),
				0,//完成状态默认赋值为0
				this.get("aad404")				
			};
		this.apppendSql(sql3.toString(),args3);
    }
	
	//虚拟货币单次购买饰品方法
	public boolean buyAccessories()throws Exception
    {
		//先判断能不能买
		if(allowPurchase(this.get("aac601")))
		{
			Tools.completeMission(this.get("aab101"), 6);
			//插入单次购买事务语句
			this.buyAccessories(this.get("aac601"));
			//执行事务
			return this.executeTransaction();
		}
		else//不能购买
		{
			return false;
		}
    }
	
	//虚拟货币批量购买饰品方法
	public boolean buyAccessoriesList()throws Exception
	{
		//还原页面主键
    	Object idlist[]=this.getIdList("idlist");
    	//查询饰品总体价格,以及是否都有货
    	String sql="select aac605,aac606 from ac06 where aac601=?";
    	List<Map<String, Object>> accList=new ArrayList<>();
    	Map<String, Object> map=null;
    	for(Object id:idlist)
		{
			map=this.queryForMap(sql, id);
			accList.add(map);
		}
    	
    	//总价格
    	int count=0;
    	for(Map<String,Object> m:accList)
    	{
    		count+=Double.parseDouble(m.get("aac605").toString());
    		if(Integer.parseInt(m.get("aac606").toString())<1)
    		{
    			this.setMessage("库存不足");
    			return false;
    		}    	
    	}
    	Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		//用户金币不足,购买失败
		if(money<count)
		{
			this.setMessage("用户金额不足");
			return false;
		}
		if(this.get("aad402")==null)
		{
			this.setMessage("请输入玩家游戏ID");
			return false;
		}
		//对于每种不同饰品,插入事务语句
		for(Object id:idlist)
		{
			this.buyAccessories(id);
		}
		//执行事务
		return executeTransaction();
	}
	
	//出售饰品给网站
	public boolean sellAccessories()throws Exception
	{
		String sql="insert into ad03(aac601,aab101,aad302,aad303,aad304,aad305) values(?,?,?,?,?,current_timeStamp)";
		Object args[]=
			{
					this.get("aac601"),
					this.get("aab101"),
					this.get("aad302"),
					0,
					this.get("aad304")
			};
		//防止用户多次虚价出售饰品干扰网站运行
		String sql2="select count(*)num from ad03 where aab101=? and aad303=2";
		int count=Tools.getFailCount(sql2, this.get("aab101"));	
		if(count>10)
		{
			this.setMessage("交易失败数量过大,禁止继续发起交易");
			return false;	
		}

		Tools.completeMission(this.get("aab101"), 5);
		return this.executeUpdate(sql, args)>0;
		
	}
	
	//根据饰品ID查找其他信息
	public Map<String, Object> findAccessories(Object aac601) throws Exception
	{
		//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac601,a.aac602,a.aac603,a.aac604,a.aac605,a.aac606,")
    			.append("       a.aac101")
    			.append("  from ac06 a")
    			.append(" where a.aac601=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), aac601);
	}
	
	
	
	/**
	   * 饰品信息按名字模糊查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aac602=this.get("qaac602");     //姓名  模糊查询
	  	
	  		StringBuilder whereSql=new StringBuilder();
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()

	  				.append("select x.aac601,x.aac602,x.aac603,x.aac604,x.aac605,x.aac606,x.aac101")
	  				.append("		 from ac06 x ,ac01 y")
	  				.append("        where x.aac101=y.aac101   ")
	  				;  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac602))
	  		{
	  			whereSql.append(" and aac602 like ?");
	  			sql.append(" and aac602 like ?");
	  			paramList.add("%"+aac602+"%");
	  		}				
	  		sql.append(" order by aac602");
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			map1.put("floor", String.valueOf(countFloor("ac06 x",whereSql.toString(),paramList.toArray())));
			map1.put("nowFloor", String.valueOf(nowFloor));
			rows.add(map1);
			sql.append(" limit ?,10 ");
			paramList.add((nowFloor-1)*10);
			for(Map<String, Object> list:this.queryForList(sql.toString(), paramList.toArray()))
			{
				rows.add(list);
			}
	  		return rows;
	  }
	
	/**
	   * 饰品信息单一实例查询
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> findById()throws Exception
    {
    	//1.编写SQL语句
	//	System.out.println(this.get("aac601"));
	//	System.out.println(this.get("param"));
    	StringBuilder sql1=new StringBuilder()
    			.append("select x.aac601,x.aac602,x.aac603,x.aac604,x.aac605,x.aac606,y.aac102,y.aac101")
  				.append("		 from ac06 x ,ac01 y")
  				.append("        where x.aac101=y.aac101   ")	
  				.append("         and x.aac601= ? ");
    			;  	
    			String aac601=null;
    			if(this.get("aac601") instanceof java.lang.String[])
    			{
    				String[] array=(String[])this.get("aac601");
    				aac601=array[0];
    			}
    			else
    			{
    				aac601=this.get("aac601").toString();
    			}
    	//执行查询
        return this.queryForMap(sql1.toString(), aac601);
    }
	
	/**
	 * 添加一行饰品信息
	 * @return
	 * @throws Exception
	 */
	private boolean addAcc()throws Exception
    {		
    	//1.编写SQL语句	
	
		Object aac101=this.findIdByNameAc01();
		System.out.println("aac101:"+aac101);
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac06 (aac602,aac603,aac604,aac605,  ")
    			.append("    			                   aac606,aac101)    ")
    			.append("    			                   values(?,?,?,?,?,? )  ")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac602"),
    			this.get("aac603"),
    			this.get("aac604"),
    			this.get("aac605"),
    			this.get("aac606"),
    			aac101
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	 /**
	  * 修改饰品数据
	 * @return
	 * @throws Exception
	 */
	   private boolean modifyAcc()throws Exception
	    {
		
		   // Object aac101=this.findIdByNameAc01();
		   // System.out.println("aac101:"+aac101);
	    	StringBuilder sql=new StringBuilder()
	    			.append("	update ac06 set aac602=?,aac603=?,aac604=?,aac605=?,aac606=?  ")
		            .append("   where aac601=? ")
	    			;
	    	System.out.println(this.get("aac601"));
	    	Object args[]={
	    			this.get("aac602"),
	    			this.get("aac603"),
	    			this.get("aac604"),
	    			this.get("aac605"),
	    			this.get("aac606"),
	    			this.get("aac601")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	   
	   
	   /**
		 * 饰品数据批量删除
		 * @return
		 * @throws Exception
		 */
		private boolean batchDelAcc()throws Exception
	    {
	    	//1.定义SQL语句
	    	String sql="delete from ac06 where aac601=?";
	    	//2.获取页面idlist数组
	    	String idlist[]=this.getIdList("idlist");
	    	//3.执行
	    	return this.batchUpdate(sql, idlist);
	    }
		
		
		/**
		 * 单一实例删除
		 * @return
		 * @throws Exception
		 */
		private boolean delByIdAcc()throws Exception
	    {
	    	String sql="delete from ac06 where aac601=?";
	    	return this.executeUpdate(sql, this.get("aac601"))>0;
	    }
}