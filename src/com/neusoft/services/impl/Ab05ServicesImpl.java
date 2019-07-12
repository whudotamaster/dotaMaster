package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import jdk.nashorn.internal.ir.Flags;

public class Ab05ServicesImpl extends JdbcServicesSupport 
{

	/**
	 * 论坛主页帖子不定条件查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryPost() throws Exception 
	{
		// 还原页面查询条件
		Object aab502 = this.get("aab502"); // 标题 模糊查询
		Object aab506 = this.get("aab506"); // 普通区或精华区

		// 定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append(" select b.aab501,b.aab101,a.aab102,a.aab105,b.aab502,")
				.append("	     b.aab504,b.aab505,b.aab506")
				.append("   from ab05 b,ab01 a")
				.append("  where b.aab101=a.aab101 ")
				;

		// 参数列表
		List<Object> paramList = new ArrayList<>();
		// 逐一判断查询条件是否录入,拼接AND条件

		if (this.isNotNull(aab502)) 
		{
			sql.append(" and b.aab502 like ?");
			paramList.add("%" + aab502 + "%");
		}
		if (this.isNotNull(aab506) && aab506.equals("1")) 
		{
			sql.append(" and b.aab506=?");
			paramList.add(aab506);
		}
		sql.append(" order by b.aab504 desc ");
		return this.queryForList(sql.toString(), paramList.toArray());
	}

	/**
	 * 论坛主页帖子加精
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean modifyGoodPost() throws Exception 
	{
		// 1.定义SQL语句
		String sql = "update ab05 a set aab506='1' where a.aab501=?";
		// 2.获取页面idlist数组
		String idlist[] = this.getIdList("idlist");
		// 3.执行
		return this.batchUpdate(sql, idlist);
	}

	/**
	 * 论坛主页帖子刪除
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delPostById() throws Exception 
	{
		Object aab501 = this.get("aab501");
		String sql1 = "delete from ab06 where aab501=?";
		this.apppendSql(sql1, aab501);
		String sql2 = "delete from ab07 where aab501=?";
		this.apppendSql(sql2, aab501);
		String sql3 = "delete from ab05 where aab501=?";
		this.apppendSql(sql3, aab501);
		return executeTransaction();
	}

	/**
	 * 发帖
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addPost() throws Exception 
	{

		Object aab101 = this.get("aab101");
		Object aab502 = this.get("apaab502");
		Object aab503 = this.get("apaab503");
		if (this.isNotNull(aab101) && this.isNotNull(aab502) && this.isNotNull(aab503)
				&& !aab503.equals("<p><br></p>")) 
		{
			StringBuilder sql = new StringBuilder()
					.append(" insert into ab05(aab101,aab502,aab503,aab504,aab505,")
					.append("                  aab506)")
					.append("           values(?,?,?, current_timestamp(),'0',")
					.append("                  '0')");
			Object args[] = 
				{ 		aab101,
						aab502, 
						aab503 
				};

			Boolean tag = this.executeUpdate(sql.toString(), args) > 0;
			Ab01ServicesImpl ab01=new Ab01ServicesImpl();
			ab01.addExp(aab101, "addPost");
			return tag;

		}
		return false;
	}

	/**
	 * 指定帖子查询加载入口
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> postFindById() throws Exception 
	{
		// 还原页面查询条件
		Object aab501 = this.get("aab501"); // 帖子ID
		Object aab101 = this.get("aab101"); // 用戶ID
		return postFindById(aab101 ,aab501);
	}

	/**
	 * 指定帖子查询加载(帖子 回复 收藏状态)
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> postFindById(Object aab101 , Object aab501) throws Exception 
	{
		// 定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab101,a.aab102,a.aab105,b.aab502,b.aab503,")
				.append("        b.aab504")
				.append("   from ab01 a,ab05 b")
				.append("  where b.aab501=? and a.aab101=b.aab101")
				.append("  order by b.aab504")
				;
		// 参数列表
		List<Map<String, String>> rows = this.queryForList(sql.toString(), aab501);
		Ab07ServicesImpl ab07=new Ab07ServicesImpl();
		Boolean collection=ab07.queryCollection(aab101,aab501); //收藏状态
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("collection", collection.toString());
		rows.add(map1);											//加进去
		Ab06ServicesImpl ab06=new Ab06ServicesImpl();
		List<Map<String, String>> commentList = ab06.commentFindById(aab501);
		for(Map<String, String> comment:commentList)
		{
			rows.add(comment);
		}
		return rows;
	}
	
	/**
	 * 回复
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addComment() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object aab501 = this.get("aab501");
		Object aab603 = this.get("acaab603");
		if (this.isNotNull(aab101) && this.isNotNull(aab501) && this.isNotNull(aab603)) 
		{
			String sql1 = " select aab505 from ab05 where aab501=?";
			List<Map<String, String>> aab505_1 = this.queryForList(sql1, aab501);
			String floor = null;
			for (Map<String, String> aObject : aab505_1) {
				floor = aObject.get("aab505");
			}
			int aab505 = Integer.parseInt(floor) + 1;
			StringBuilder sql2 = new StringBuilder()
					.append(" insert into ab06(aab101,aab501,aab602,aab603,aab604)")
					.append("    values (?,?,?,?,current_timestamp())")
					;
			Object args1[] = { 
								aab101, 
								aab501, 
								aab505, 
								aab603 
								};
			Boolean tag = this.executeUpdate(sql2.toString(), args1) > 0;
			StringBuilder sql3 = new StringBuilder()
					.append(" update ab05 ")
					.append("    set aab505 = ? ,aab504 = current_timestamp() ")
					.append("  where aab501= ? ")
					;
			Object args2[] = { 
								aab505, 
								aab501 
								};
			tag = this.executeUpdate(sql3.toString(), args2) > 0 && tag;
			Ab01ServicesImpl ab01=new Ab01ServicesImpl();
			ab01.addExp(aab101, "addComment");
			return tag;
		}
		return false;
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
		return	this.executeUpdate(sql.toString(), args)>0;
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
		return	this.executeUpdate(sql, args)>0;
	}
	
	/**
	 * 加载时判断用户收藏状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryCollectionList() throws Exception
	{
		Object aab101 = this.get("aab101");
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701,a.aab501,a.aab101,a.aab702,b.aab502,c.aab102")
    			.append("  from ab07 a,ab05 b,ab01 c")
    			.append(" where a.aab101=? and a.aab501=b.aab501 and b.aab101=c.aab101")
    			.append(" order by a.aab702 desc")
    			;
    	System.out.println("aab101:" + this.get("aab101"));
    	return queryForList(sql.toString(), aab101);
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
	public List<Map<String,String>> queryHistory() throws Exception 
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
		String sql1 = "delete from ab06 where aab501=?";
		String sql2 = "delete from ab07 where aab501=?";
		String sql3 = "delete from ab05 where aab501=?";
		for (String aab501:idlist) 
		{
			this.apppendSql(sql1, aab501);
			this.apppendSql(sql2, aab501);
			this.apppendSql(sql3, aab501);
		}
		return executeTransaction();
	}
}
