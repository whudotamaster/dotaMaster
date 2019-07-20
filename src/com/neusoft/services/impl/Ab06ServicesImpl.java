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
	protected final List<Map<String, Object>> commentFindById(Object aab501, Object limitFloor ,int number ) throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604 ")
				.append("   from ab01 a,ab06 b ")
				.append("  where aab501=? and a.aab101=b.aab101 ")
				.append("  order by b.aab604")
				.append(" limit ?,?")
				;
		// 参数列表
		Object args[] = {
							aab501,
							limitFloor,
							number
						};
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		for(Map<String, Object> ins:this.queryForList(sql.toString(), args))
		{
			ins.put("aab604", ins.get("aab604").toString().replace(".0", ""));
			rows.add(ins);
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
			List<Map<String, Object>> aab505_1 = this.queryForList(sql1, aab501);
			Object floor = null;
			for (Map<String, Object> aObject : aab505_1) {
				floor = aObject.get("aab505");
			}
			int aab505 = Integer.parseInt(floor.toString()) + 1;
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
			Tools.completeMission(aab101, 1);
			Tools.sendMessage("恭喜你完成每日任务_回帖，获得经验5点，M点5点！", aab101);
			Ab01ServicesImpl ab01=new Ab01ServicesImpl();
			ab01.addExp(aab101, "addComment");
			return tag;
		}
		return false;
	}

}
