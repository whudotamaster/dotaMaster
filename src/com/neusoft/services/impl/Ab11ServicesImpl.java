package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import jdk.nashorn.internal.ir.Flags;

public class Ab11ServicesImpl extends JdbcServicesSupport 
{
	private boolean delLike() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object aab501 = this.get("aab501");
		String sql = "delete from ab11 where aab101=? and aab501=?";
		Object args[]={
						aab101,
						aab501
					  };
		return executeUpdate(sql, args)>0;
	}

	private boolean addLike() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object aab501 = this.get("aab501");
		String sql = "insert into ab11(aab101,aab501) values (?,?)";
		Object args[]={
						aab101,
						aab501
					  };
		return executeUpdate(sql, args)>0;
	}
	
	public Map<String, Object> countLike(Object aab501) throws Exception
	{
    	String sql="select count(1) countlike from ab11 where aab501 = ?";	
    	return queryForMap(sql, aab501);
	}
	
	public final Boolean countUserLike(Object aab101,Object aab501) throws Exception
	{
    	String sql="select aab101 from ab11 where aab101 = ? and aab501 = ?";	
    	Object args[]={
    					aab101,
    					aab501
    				  };
    	return queryForMap(sql, args) != null ;
	}

	/**
	 * 指定帖子查询的加载(帖子 回复 收藏状态)
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> postFindById() throws Exception 
	{
		Ab05ServicesImpl ab05 = new Ab05ServicesImpl();
		return ab05.postFindById(this.get("aab101") , this.get("aab501"));
	}
}
