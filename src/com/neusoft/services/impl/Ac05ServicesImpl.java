package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac05ServicesImpl extends JdbcServicesSupport 
{

	 /**
	   * 装备信息按名字模糊查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aac502=this.get("qaac502");     //姓名  模糊查询
	  	
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac501,aac502,aac503,aac504,aac505")
	  				.append("		 from ac05 ")
	  				;  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac502))
	  		{
	  			sql.append(" where aac502 like ?");
	  			paramList.add("%"+aac502+"%");
	  		}				
	  		sql.append(" order by aac502");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	
	
	/**
	 * 添加一行装备
	 * @return
	 * @throws Exception
	 */
	private boolean addEquipment()throws Exception
    {		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac05 (aac502,aac503,aac504,aac505)   ")
    			.append("            values(?,?,?,?)           ")            
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac502"),
    			this.get("aac503"),
    			this.get("aac504"),
    			this.get("aac505"),
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	/**
	 * 装备数据批量删除
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteEquipment()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ac05 where aac501=?";
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
	private boolean deleteByIdEquipment()throws Exception
    {
    	String sql="delete from ac05 where aac501=?";
    	return this.executeUpdate(sql, this.get("aac501"))>0;
    }
	
	
	 /**
	   * 装备信息点击名字查询
	 * @return
	 * @throws Exception
	 */
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select  aac502,aac503,aac504,aac505")
	  				.append("		 from ac05 ")
	    			.append(" where aac501=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aac501"));
	    }
	 
	 
	 /**
	  * 修改装备数据
	 * @return
	 * @throws Exception
	 */
	private boolean modifyEquipment()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac05 set aac502=?,aac503=?,aac504=?,aac505=?  ")
	    			.append("                  where aac501=?                       ")
	    			;
	    	Object args[]={
	    			this.get("aac502"),
	    			this.get("aac503"),
	    			this.get("aac504"),
	    			this.get("aac505"),
	    			this.get("aac501")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	 
}
