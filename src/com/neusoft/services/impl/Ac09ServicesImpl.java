package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
public class Ac09ServicesImpl extends JdbcServicesSupport
{

	 /**
	   * 战队信息按名字模糊查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
		int number = 10;
	  		//还原页面查询条件
	  		Object aac902=this.get("qaac902");     //姓名  模糊查询
	  	
	  		//定义SQL主体
	  		StringBuilder whereSql=new StringBuilder();
	  		StringBuilder sql=new StringBuilder()
	  				.append(" select x.aac901,x.aac902,x.aac903,x.aac904    ")
	  				.append("	  				 from ac09 x                ")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac902))
	  		{
	  			whereSql.append(" and aac902 like  ? ");
	  			sql.append(" where aac902 like  ? ");
	  			paramList.add("%"+aac902+"%");
	  		}
	  				
	  		sql.append(" order by aac902");
	  		
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			map1.put("floor", String.valueOf(countFloor(" ac09 ",whereSql.toString(),number,paramList.toArray())));
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
	 * 添加一行战队信息
	 * @return
	 * @throws Exception
	 */
	private boolean addTeam()throws Exception
    {		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac09 (aac902,aac903,aac904)") 		 			
    			.append("                   values(?,?,?) ")          
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac902"),
    			this.get("aac903"),
    			this.get("aac904")
       	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	 /**
	   * 战队及战队成员信息点击名字查询
	 * @return
	 * @throws Exception
	 */

	    
	    public List<Map<String,Object>> FBIforMore()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    	       .append(" select y.aac1001,y.aac1002,y.aac1003,y.aac1004,y.aac1005,  ")
	    	       .append("       x.aac901,x.aac902,x.aac903,x.aac904                  ")       
	    	       .append("       from ac09 x ,ac10 y                                 ")
	    	       .append("       where x.aac901=y.aac901                             ")
	    	       .append("       and y.aac901=?                                     ")  
	    	       ;
	    	System.out.println(this.get("aac901"));
	    	System.out.println(this.queryForList(sql.toString(), this.get("aac901")));
	    	return this.queryForList(sql.toString(), this.get("aac901"));
	    }
	     
	     
	     /**
		  * 修改战队数据
		 * @return
		 * @throws Exception
		 */
		private boolean modifyTeam()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			.append(" update ac09 set  aac902=?,aac903=?,aac904=? ")
		    			.append("                  where aac901=? ")
		    			;
		    	Object args[]={
		    			this.get("aac902"),
		    			this.get("aac903"),
		    			this.get("aac904"),
		    			this.get("aac901")
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;
		    	
		    }
}
