package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ab05ServicesImpl extends JdbcServicesSupport 
{

	  /**
     * 论坛主页帖子不定条件查询
     * @return
     * @throws Exception
     */
	  public List<Map<String,String>> queryPost()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aab502=this.get("aab502");     //标题  模糊查询
	  		Object aab506=this.get("aab506");     //普通区或精华区

	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append(" select b.aab501,b.aab101,a.aab102,a.aab105,b.aab502,b.aab504,b.aab505,")
	  				.append("	     b.aab506")
	  				.append("   from ab05 b,ab01 a")
	  				.append( "  where b.aab101=a.aab101  ")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		
	  		if(this.isNotNull(aab502))
	  		{
	  			sql.append(" and b.aab502 like ?");
	  			paramList.add("%"+aab502+"%");
	  		}
	  		if(this.isNotNull(aab506) && aab506.equals("1"))
	  		{
	  			sql.append(" and b.aab506=?");
	  			paramList.add(aab506);
	  		}
	  		sql.append(" order by b.aab504 ");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  	/**
	     * 论坛主页帖子加精
	     * @return
	     * @throws Exception
	     */
	    private boolean modifyGoodPost()throws Exception
	    {
	    	//1.定义SQL语句
	    	String sql="update ab05 a set aab506='1' where a.aab501=?";
	    	//2.获取页面idlist数组
	    	String idlist[]=this.getIdList("idlist");
	    	//3.执行
	    	return this.batchUpdate(sql, idlist);	
	    }
	  
	    /**
	     * 论坛主页帖子刪除
	     * @return
	     * @throws Exception
	     */
	    private boolean delPost()throws Exception
	    {
	    	String sql1="delete from ab06 where aab501=?";
	    	if(this.executeUpdate(sql1, this.get("aab501"))>0)
	    	{
	    		String sql2="delete from ab05 where aab501=?";
		    	return this.executeUpdate(sql2, this.get("aab501"))>0;
	    	}
	    	return false;
	    }
	    
	    /**
	     * 发帖
	     * @return
	     * @throws Exception
	     */
	    private boolean addPost()throws Exception
	    {
	    	Object aab101=this.get("aab101");
	    	Object aab502=this.get("apaab502");
	    	Object aab503=this.get("apaab503");
	    	if (this.isNotNull(aab101)&&this.isNotNull(aab502)&&this.isNotNull(aab503)) {
	    		StringBuilder sql=new StringBuilder()
		    			.append(" insert into ab05(aab101,aab502,aab503,aab504,aab505,")
		    			.append("                  aab506)")
		    			.append("           values(?,?,?, current_timestamp(),'0',")
		    			.append("                  '0')")
		    			;
	    		Object args[]=
	    			{
	    				aab101,
	    				aab502,
	    				aab503
	    			}
	    			;
	  			return this.executeUpdate(sql.toString(), args)>0;
			} 
	    	return false;
	    }

	    /**
	     * 指定帖子查询
	     * @return
	     * @throws Exception
	     */
		  public List<Map<String,String>> postFindById()throws Exception
		  {
		  		//还原页面查询条件
		  		Object aab501=this.get("aab501");     //帖子ID
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  				.append(" select a.aab102,a.aab105,b.aab502,b.aab503,b.aab504")
		  				.append("   from ab01 a,ab05 b")
		  				.append("  where a.aab101=b.aab101 and b.aab501=?")
		  				;
		  		//参数列表
		  		List<Object> paramList=new ArrayList<>();
		  			paramList.add(aab501);
		  		return this.queryForList(sql.toString(), paramList.toArray());
		  }
		  
		  /**
		     * 指定帖子的回复查询
		     * @return
		     * @throws Exception
		     */
			  public List<Map<String,String>> commentFindById()throws Exception
			  {
			  		//还原页面查询条件
			  		Object aab501=this.get("aab501");     //帖子ID
			  		//定义SQL主体
			  		StringBuilder sql=new StringBuilder()
			  				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604")
			  				.append("   from ab01 a,ab06 b")
			  				.append("  where a.aab101=b.aab101 and b.aab501=?")
			  				.append("  order by b.aab602 ")
			  				;
			  		//参数列表
			  		List<Object> paramList=new ArrayList<>();
			  			paramList.add(aab501);
			  		return this.queryForList(sql.toString(), paramList.toArray());
			  }
}
