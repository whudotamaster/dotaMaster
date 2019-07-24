package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

/**
 * @author Recardox
 *
 */
public class Ac01ServicesImpl extends JdbcServicesSupport 
{
	
                           
	  /**
	   * 英雄信息按名字模糊查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
		int number = 100;
	  		//还原页面查询条件
	  		Object aac102=this.get("qaac102");     //姓名  模糊查询
	  	
	  		
	  		//定义SQL主体
	  		StringBuilder whereSql=new StringBuilder();
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac101,aac102,aac103,aac104,aac105,")
	  				.append("       aac106,aac107,aac108,aac109,aac110,")
	  				.append("		aac111,aac112")
	  				.append("		 from ac01 ")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac102))
	  		{
	  			whereSql.append(" and aac102 like ?");
	  			sql.append(" where aac102 like ?");
	  			paramList.add("%"+aac102+"%");
	  		}
	  				
	  		sql.append(" order by aac102");
	  		
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			map1.put("floor", String.valueOf(countFloor(" ac01 ",whereSql.toString(),number,paramList.toArray())));
			map1.put("nowFloor", String.valueOf(nowFloor));
			rows.add(map1);
			
			
			sql.append(" limit ?,? ");
			paramList.add((nowFloor-1)*number);
			paramList.add(number);
			for(Map<String, Object> list:this.queryForList(sql.toString(), paramList.toArray()))
			{
				rows.add(list);
			}
	  		return rows;
	  }
	
	
	/**
	 * 添加一行英雄
	 * @return
	 * @throws Exception
	 */
	private boolean addHero()throws Exception
    {		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac01 (aac102,aac103,aac104,aac105,")
    			.append("                   aac106,aac107,aac108,aac109,aac110,")
    			.append("				    aac111,aac112) ")
    			.append("                   values(?,?,?,?,?,")
    			.append("				           ?,?,?,?,?, ")
    			.append("						   ?) ")	            
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac102"),
    			this.get("aac103"),
    			this.get("aac104"),
    			this.get("aac105"),
    			this.get("aac106"),
    			this.get("aac107"),
    			this.get("aac108"),
    			this.get("aac109"),
    			this.get("aac110"),
    			this.get("aac111"),
    			this.get("aac112")
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	/**
	 * 英雄数据批量删除
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteHero()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ac01 where aac101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
	
	
	  /**
	   * 英雄信息点击名字查询
	 * @return
	 * @throws Exception
	 */
	 //查找英雄的天赋
	 public Map<String, Object> findById()throws Exception
	 {
		
		 StringBuilder sql=new StringBuilder()
				 .append(" select aac102,aac103,aac104,aac105,aac101,   ")
				 .append("	  			       aac106,aac107,aac108,aac109,aac110,  ")
				 .append("	  						  aac111,aac112         ")
				 .append("	  						 from ac01        ")
				 .append("                 where aac101=?       ")
				 ;
		 Map<String, Object> ins=this.queryForMap(sql.toString(), this.get("aac101"));
		 String sql2="select y.aac201,y.aac202,y.aac203 from ac02 y where y.aac101=?";
		 List<Map<String, Object>> rows=this.queryForList(sql2, this.get("aac101"));
		 ins.put("rows", rows);
		 String sql3 ="select aac301,aac302,aac303,aac304,aac305,aac306 from ac03 where aac101=? ";
		 List<Map<String, Object>> rows2=this.queryForList(sql3.toString(), this.get("aac101"));
		 ins.put("rows2", rows2);
		 String sql4 ="select aac601,aac602,aac603 from ac06 where aac101=? ";
		 List<Map<String, Object>> rows3=this.queryForList(sql4.toString(), this.get("aac101"));
		 ins.put("rows3", rows3);
		 
		 return ins;
	 }
	 
	 /**
	  * 修改英雄数据
	 * @return
	 * @throws Exception
	 */
	private boolean modifyHero()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac01 set  aac102=?,aac103=?,aac104=?,aac105=?, ")
	    			.append("                  aac106=?,aac107=?,aac108=?,aac109=?,aac110=?, ")
	    			.append("			       aac111=? ")
	    			.append("                  where aac101=? ")
	    			;
	    	Object args[]={
	    			this.get("aac102"),
	    			this.get("aac103"),
	    			this.get("aac104"),
	    			this.get("aac105"),
	    			this.get("aac106"),
	    			this.get("aac107"),
	    			this.get("aac108"),
	    			this.get("aac109"),
	    			this.get("aac110"),
	    			this.get("aac111"),
	    			this.get("aac101")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	private boolean modifySAT()throws Exception
	{
		String sql1="update ac02 set aac202=?,aac203=? where aac201=?";
		Object args1[]={
				this.get("aac2021"),
				this.get("aac2031"),
				this.get("aac2011")
		};
		this.executeUpdate(sql1, args1);
		String sql2="update ac02 set aac202=?,aac203=? where aac201=?";
		Object args2[]={
				this.get("aac2022"),
				this.get("aac2032"),
				this.get("aac2012")
		};
		this.executeUpdate(sql2, args2);
		String sql3="update ac02 set aac202=?,aac203=? where aac201=?";
		Object args3[]={
				this.get("aac2023"),
				this.get("aac2033"),
				this.get("aac2013")
		};
		this.executeUpdate(sql3, args3);
		String sql4="update ac02 set aac202=?,aac203=? where aac201=?";
		Object args4[]={
				this.get("aac2024"),
				this.get("aac2034"),
				this.get("aac2014")
		};
		this.executeUpdate(sql4, args4);
		String SQL1="update ac03 set aac302=?,aac303=?,aac304=?,aac305=? where aac301=?";
		Object args2_1[]={
				this.get("aac3021"),
				this.get("aac3031"),
				this.get("aac3041"),
				this.get("aac3051"),
				this.get("aac3011")
		};
		this.executeUpdate(SQL1, args2_1);
		String SQL2="update ac03 set aac302=?,aac303=?,aac304=?,aac305=? where aac301=?";
		Object args2_2[]={
				this.get("aac3022"),
				this.get("aac3032"),
				this.get("aac3042"),
				this.get("aac3052"),
				this.get("aac3012")
		};
		this.executeUpdate(SQL2, args2_2);
		String SQL3="update ac03 set aac302=?,aac303=?,aac304=?,aac305=? where aac301=?";
		Object args2_3[]={
				this.get("aac3023"),
				this.get("aac3033"),
				this.get("aac3043"),
				this.get("aac3053"),
				this.get("aac3013")
		};
		this.executeUpdate(SQL3, args2_3);
		String SQL4="update ac03 set aac302=?,aac303=?,aac304=?,aac305=? where aac301=?";
		Object args2_4[]={
				this.get("aac3024"),
				this.get("aac3034"),
				this.get("aac3044"),
				this.get("aac3054"),
				this.get("aac3014")
		};
		this.executeUpdate(SQL4, args2_4);
		String SQL5="update ac03 set aac302=?,aac303=?,aac304=?,aac305=? where aac301=?";
		Object args2_5[]={
				this.get("aac3025"),
				this.get("aac3035"),
				this.get("aac3045"),
				this.get("aac3055"),
				this.get("aac3015")
		};
		this.executeUpdate(SQL5, args2_5);
		System.out.println(this.get("aac3025"));
		return this.executeUpdate(SQL5, args2_5)>0;
	}
	/**
	 * 单一实例删除
	 * @return
	 * @throws Exception
	 */
	private boolean deleteByIdHero()throws Exception
    {
    	String sql="delete from ac01 where aac101=?";
    	return this.executeUpdate(sql, this.get("aac101"))>0;
    }
}