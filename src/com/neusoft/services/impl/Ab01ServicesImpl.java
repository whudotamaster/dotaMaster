package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	//使用虚拟货币购买或续费会员
	public boolean buyVIP()throws Exception
    {
		//如果金钱不足开通的月数
		if(this.getMoney(this.get("aab101"))<Integer.parseInt(this.get("month").toString())*1000)
			return false;
		
		//进行开通或续费会员操作
		StringBuilder sql=new StringBuilder();
		boolean tag=this.isVIP(this.get("aab101"));
		
		System.out.println(tag);
		//如果是会员 在他的到期时间后增加续费时长
		if(tag)
		{
				sql.append("update ab01 a")
					.append("   set a.aab106=a.aab106-?, a.aab109 = DATE_ADD(a.aab109, INTERVAL ? MONTH)")
					.append(" where a.aab101=?")
					;
    	}
		else//不是会员 在当前时间+他的购买时长
		{
			sql.append("update ab01 a")
			.append("   set a.aab106=a.aab106-?,a.aab109 = DATE_ADD(current_date, INTERVAL ? MONTH)")
			.append(" where a.aab101=?")
			;
		}
		
		Object args[]={
				Integer.parseInt(this.get("month").toString())*1000,//此处填写用户扣的金额数,根据网页传来的用户购买月数*每月金额
				this.get("month"),
				this.get("aab101")
		};
		System.out.println("开通成功");
    	return this.executeUpdate(sql.toString(), args)>0;
    }
	
	//辅助方法 判断是否为VIP
	public boolean isVIP(Object aab101)throws Exception
	{
		String sql="select aab109 from ab01 where aab101=? and aab109>current_date";
		Map<String, String> map=this.queryForMap(sql, aab101);
		if(map==null)
			return false;
		else
			return true;
	}
	
    private boolean deleteById()throws Exception
    {
    	String sql="delete from ab01 where aab101=?";
    	return this.executeUpdate(sql, this.get("aab101"))>0;
    }
    
    private boolean modifyEmp()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab102=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab111=?,a.aab112=?,")
    			.append("       a.aab113=?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab102"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113"),
    			this.get("aab101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    //提供一个接口便于快速修改余额
    public boolean updateMoney(Object aab106,Object aab101)throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			aab106,
    			aab101
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
    
    public Double getMoney(Object aab101)throws Exception
    {

    	String sql="select aab106 from ab01 where aab101=?";
    	Map<String, String> map=this.queryForMap(sql, aab101);
    	return Double.valueOf(map.get("aab106"));
    }
    
    public List<Map<String,String>> queryBuyOrder()throws Exception
    {
    	String sql="select * from ad04 where aab101=?";                                                                                                                                                                               
    	return this.queryForList(sql, this.get("aab101"));
    }
    
    public List<Map<String,String>> querySellOrder()throws Exception
    {
    	String sql="select * from ad03 where aab101=?";                                                                                                                                                                               
    	return this.queryForList(sql, this.get("aab101"));
    }
    
    //登录判断方法
    public List<Map<String,String>> loginEmp()throws Exception
    {
    	Object aab103 = this.get("aab103");
    	Object aab104 = this.get("aab104");
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab101,a.aab102,a.aab105,a.aab106,a.aab107,a.aab108")	
    			.append("  from ab01 a")
    			.append(" where a.aab103=? and a.aab104=?")
    			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(aab103);
    	paramList.add(aab104);
    	return this.queryForList(sql.toString(), paramList.toArray());
    }
    
    //用户名查重
    private boolean isExist()throws Exception
    {
    	
    	StringBuilder sql=new StringBuilder()
    			.append(" select *")
    			.append("   from ab01 a")
    			.append("  where a.aab103=?")
    			;
    	return this.queryForMap(sql.toString(), this.get("aab103"))!=null;
    }
    //用户注册
    public int logonEmp()throws Exception
    {
    	try
    	{
	    	if (isExist()==true)
	    	{
	    		return 1000;//重名用户名不允许注册
	    	}
	    	else
	    	{  
		    	Object aab103 = this.get("aab103");
		    	Object aab104 = this.get("aab104");
		    	//进行用户输入的数据长度判断
		    	if(((String) aab103).length()>15||((String) aab104).length()>15)
		    	{
		    		return 2000;
		    	}
		    	else
		    	{
			    	StringBuilder sql=new StringBuilder()
			    			.append("insert into ab01")
			    			.append("(aab102,aab103,aab104,aab105,aab106,")
			    			.append(" 						aab107,aab108,aab109)")
			    			.append("values (?,?,?,'空',0,")
			    			.append("							0,1,0000-00-00)")
			       			;
			    	List<Object> paramList =new ArrayList<>();
			    	paramList.add(aab103);
			    	paramList.add(aab103);
			    	paramList.add(aab104);
			    	this.executeUpdate(sql.toString(), paramList.toArray());
			    	return 0;
			    	//成功写入数据库
			    }
		    
	    	}
    	}
    	catch(Exception e)
    	{
    		//未输入用户名或密码报错，输出3000
    		e.printStackTrace();
    		return 3000;
    	}   	
    }
    
    private boolean addEmp()throws Exception
    {
    	//获取当前员工编号
    	String aab103=Tools.getEmpNumber();
    	//向DTO添加员工编号
    	this.put("aab103", aab103);
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aab102"),
    			aab103,
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

    private boolean batchDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ab01 where aab101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }

    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109 ")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
      
      /**
       * 不定条件查询
       * @return
       * @throws Exception
       */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aab102=this.get("qaab102");     //姓名  模糊查询
	  		Object aab103=this.get("qaab103");     //编号
	  		Object aab105=this.get("qaab105");     //性别
	  		Object aab106=this.get("qaab106");     //民族
	  		Object baab104=this.get("baab104");    //生日B
	  		Object eaab104=this.get("eaab104");    //生日E
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" and x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
	  		}
	  		if(this.isNotNull(aab103))
	  		{
	  			sql.append(" and x.aab103=?");
	  			paramList.add(aab103);
	  		}
	  		if(this.isNotNull(aab105))
	  		{
	  			sql.append(" and x.aab105=?");
	  			paramList.add(aab105);
	  		}
	  		if(this.isNotNull(aab106))
	  		{
	  			sql.append(" and x.aab106=?");
	  			paramList.add(aab106);
	  		}
	  		if(this.isNotNull(baab104))
	  		{
	  			sql.append(" and x.aab104>=?");
	  			paramList.add(baab104);
	  		}
	  		if(this.isNotNull(eaab104))
	  		{
	  			sql.append(" and x.aab104<=?");
	  			paramList.add(eaab104);
	  		}
	  		
	  		sql.append(" order by x.aab102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }

}