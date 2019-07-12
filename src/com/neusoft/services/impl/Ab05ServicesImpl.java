package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import jdk.nashorn.internal.ir.Flags;

public class Ab05ServicesImpl extends JdbcServicesSupport 
{

	/**
	 * ��̳��ҳ���Ӳ���������ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryPost() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aab502 = this.get("aab502"); // ���� ģ����ѯ
		Object aab506 = this.get("aab506"); // ��ͨ���򾫻���

		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append(" select b.aab501,b.aab101,a.aab102,a.aab105,b.aab502,b.aab504,b.aab505,")
				.append("	     b.aab506").append("   from ab05 b,ab01 a").append("  where b.aab101=a.aab101  ");

		// �����б�
		List<Object> paramList = new ArrayList<>();
		// ��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����

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
	 * ��̳��ҳ���ӼӾ�
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean modifyGoodPost() throws Exception 
	{
		// 1.����SQL���
		String sql = "update ab05 a set aab506='1' where a.aab501=?";
		// 2.��ȡҳ��idlist����
		String idlist[] = this.getIdList("idlist");
		// 3.ִ��
		return this.batchUpdate(sql, idlist);
	}

	/**
	 * ��̳��ҳ���ӄh��
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
	 * ����
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
			addExp(aab101, "addPost");
			return tag;

		}
		return false;
	}

	/**
	 * ָ�����Ӳ�ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> postFindById() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aab501 = this.get("aab501"); // ����ID
		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab101,a.aab102,a.aab105,b.aab502,b.aab503,")
				.append("        b.aab504")
				.append("   from ab01 a,ab05 b")
				.append("  where b.aab501=? and a.aab101=b.aab101")
				.append("  order by b.aab504")
				;
		// �����б�
		List<Object> paramList = new ArrayList<>();
		paramList.add(aab501);
		return this.queryForMap(sql.toString(), paramList.toArray());
	}

	/**
	 * ָ�����ӵĻظ���ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> commentFindById() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aab501 = this.get("aab501"); // ����ID
		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604 ")
				.append("   from ab01 a,ab06 b ")
				.append("  where aab501=? and a.aab101=b.aab101 ")
				.append("  order by b.aab604")
				;
		// �����б�
		List<Object> paramList = new ArrayList<>();
		paramList.add(aab501);
		System.out.println("aab101:" + this.get("aab101"));
		return this.queryForList(sql.toString(), paramList.toArray());
	}

	/**
	 * �ظ�
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
			StringBuilder sql3 = new StringBuilder().append(" update ab05 ")
					.append("    set aab505 = ? ,aab504 = current_timestamp() ")
					.append("  where aab501= ? ")
					;
			Object args2[] = { 
								aab505, 
								aab501 
								};
			tag = this.executeUpdate(sql3.toString(), args2) > 0 && tag;
			addExp(aab101, "addComment");
			return tag;
		}
		return false;
	}

	/**
	 * �Ӿ���ֵ
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addExp(Object aab101, String expType) throws Exception 
	{
		String sql = "update ab01 set aab107 = aab107+? where aab101=?";
		int exp = 0;

		switch (expType) {
		case "addComment":
			exp = 10;
			break;
		case "addPost":
			exp = 5;
			break;
		default:
			break;
		}
		Object args[] = { 
							exp, 
							aab101 
						};
		return this.executeUpdate(sql, args) > 0;
	}

	/**
	 * ���Ϳ�Ǯ�ͼ�Ǯ
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean reward() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object paab101 = this.get("paab101");
		String sql1 = "update ab01 set aab106 = aab106-5 where aab101=?";
		this.apppendSql(sql1, aab101);
		String sql2 = "update ab01 set aab106 = aab106+5 where aab101=?";
		this.apppendSql(sql2, paab101);
		return this.executeTransaction();
	}
	
	/**
	 * ����ʱ�ж��û��ղ�״̬
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryCollection() throws Exception
	{
		Object aab101 = this.get("aab101");
		Object aab501 = this.get("aab501");
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701")
    			.append("  from ab07 a")
    			.append(" where a.aab101=? and a.aab501=?")
    			;
    	Object args[] = {
    						aab101,
    						aab501
    					};
    	return queryForList(sql.toString(), args);
	}

	/**
	 * ����ղ�
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
	 * �h���ղ�
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
	 * ����ʱ�ж��û��ղ�״̬
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
	 * ����ɾ���ղ�
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delCollection() throws Exception 
	{
		// 1.����SQL���
		String sql = "delete from ab07 where aab701=?";
		// 2.��ȡҳ��idlist����
		String idlist[] = this.getIdList("idlist");
		// 3.ִ��
		return this.batchUpdate(sql, idlist);
	}
	
	/**
	 * �����û���ʷ����
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryHistory() throws Exception 
	{
		// 1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab501,a.aab502,a.aab504,a.aab505 ")
				.append("   from ab05 a ")
				.append("  where a.aab101=? ")
				.append("  order by a.aab504 desc ")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	/**
	 * ���������h��
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
