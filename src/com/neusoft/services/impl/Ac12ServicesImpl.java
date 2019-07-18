package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac12ServicesImpl extends JdbcServicesSupport
{

	public List<Map<String, Object>> query()throws Exception
	{
		Object aac1202=this.get("qaac1202");
		System.out.println(aac1202);
		StringBuilder sql=new StringBuilder()
				.append("select aac1201,aac1202,aac1204 from ac12")
				;
		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aac1202))
  		{
  			sql.append(" where aac1202 like ?");
  			paramList.add("%"+aac1202+"%");
  		}
  				
  		sql.append(" order by aac1202");
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	
	/**
	 * 添加更新日志
	 * @return
	 * @throws Exception
	 */
	private boolean addChangelog()throws Exception
    {		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac12 (aac1202,aac1203,aac1204)   ")
    			.append("            values(?,?,?)           ")            
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac1202"),
    			this.get("aac1203"),
    			this.get("aac1204")		
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	

	/**
	   * 更新日志点击版本号浏览
	 * @return
	 * @throws Exception
	 */
	 public Map<String,Object> findById()throws Exception
	 {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select  aac1201,aac1202,aac1203,aac1204")
	  				.append("		 from ac12 ")
	    			.append(" where aac1201=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aac1201"));
	 }
	 
	 
	 /**
	  * 修改装备数据
	 * @return
	 * @throws Exception
	 */
	private boolean modifyChangelog()throws Exception
    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac12 set aac1202=?,aac1203=?,aac1204=?  ")
	    			.append("                  where aac1201=?                       ")
	    			;
	    	Object args[]={
	    			this.get("aac1202"),
	    			this.get("aac1203"),
	    			this.get("aac1204"),
	    			this.get("aac1201")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	}
}
