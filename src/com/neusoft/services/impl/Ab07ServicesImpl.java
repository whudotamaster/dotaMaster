package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

import jdk.nashorn.internal.ir.Flags;

public class Ab07ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 加载时判断用户收藏状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public final Boolean queryCollection(Object aab101 , Object aab501) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701")
    			.append("  from ab07 a")
    			.append(" where a.aab101=? and a.aab501=?")
    			;
    	Object args[] = {
    						aab101,
    						aab501
    					};
    	return queryForMap(sql.toString(), args) != null;
	}

	/**
	 * 添加收藏
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addCollectionById() throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into ab07(aab501,aab101,aab702)")
				.append("    values (?,?,current_timestamp())")
				;
				
		Object args[]={
						this.get("aab501"),
						this.get("aab101")
					  };
		boolean tag =  this.executeUpdate(sql.toString(), args)>0;
		this.setMessage(tag ?"收藏成功":"收藏失败");
		return	tag;
	}

	/**
	 * 刪除收藏
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delCollectionById() throws Exception 
	{
		String sql = "delete from ab07 where aab501=? and aab101=?";
		Object args[]={
						this.get("aab501"),
						this.get("aab101"),
					  };
		boolean tag =  this.executeUpdate(sql, args)>0;
		this.setMessage(tag ?"取消收藏成功":"收藏失败");
		return	tag;
	}
	
	/**
	 * 加载用户所有收藏
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> queryCollectionList() throws Exception
	{
		int number = 10;
		Object aab101 = this.get("aab101");
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701,a.aab501,c.aab101,a.aab702,b.aab502,c.aab102")
    			.append("  from ab07 a,ab05 b,ab01 c")
    			.append(" where a.aab101=? and a.aab501=b.aab501 and b.aab101=c.aab101")
    			.append(" order by a.aab702 desc")
    			.append(" limit ?,? ");
    			;
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		Object args[]={
						aab101,
						(nowFloor-1)*number,
						number
						};
    	List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	map1.put("floor", String.valueOf(countFloor("ab07 a","and a.aab101=?",number,aab101)));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		for(Map<String, Object> post:queryForList(sql.toString(), args))
		{
			rows.add(post);
		}
    	return rows;
	}

	/**
	 * 批量删除收藏
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delCollection() throws Exception 
	{
		// 1.定义SQL语句
		String sql = "delete from ab07 where aab701=?";
		// 2.获取页面idlist数组
		String idlist[] = this.getIdList("idlist");
		// 3.执行
		return this.batchUpdate(sql, idlist);
	}
	
	/**
	 * 查找用户历史发帖
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> queryHistory() throws Exception 
	{
		// 1.定义SQL语句
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab501,a.aab502,a.aab504,a.aab505 ")
				.append("   from ab05 a ")
				.append("  where a.aab101=? ")
				.append("  order by a.aab504 desc ")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	/**
	 * 帖子批量刪除
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delPost() throws Exception 
	{
		String idlist[] = this.getIdList("idlist");
		String sql0 = "delete from ab11 where aab501=?";
		String sql1 = "delete from ab06 where aab501=?";
		String sql2 = "delete from ab07 where aab501=?";
		String sql3 = "delete from ab05 where aab501=?";
		for (String aab501:idlist) 
		{
			this.apppendSql(sql0, aab501);
			this.apppendSql(sql1, aab501);
			this.apppendSql(sql2, aab501);
			this.apppendSql(sql3, aab501);
		}
		return executeTransaction();
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
		int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		return ab05.postFindById(this.get("aab101") , this.get("aab501"),nowFloor);
	}
}
