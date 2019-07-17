package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

import jdk.nashorn.internal.ir.Flags;

public class Ab06ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 指定帖子的回复查询
	 * 
	 * @return
	 * @throws Exception
	 */
	protected final List<Map<String, String>> commentFindById(Object aab501, Object limitFloor ) throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604 ")
				.append("   from ab01 a,ab06 b ")
				.append("  where aab501=? and a.aab101=b.aab101 ")
				.append("  order by b.aab604")
				.append(" limit ?,10")
				;
		// 参数列表
		Object args[] = {
							aab501,
							limitFloor
						};
		return this.queryForList(sql.toString(), args);
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

}
