package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.scenario.effect.impl.prism.ps.PPSPhongLighting_SPOTPeer;

import jdk.nashorn.internal.ir.Flags;

public class Ab05ServicesImpl extends JdbcServicesSupport 
{

	/**
	 * ��̳��ҳ���Ӳ���������ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryPost() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aab502 = this.get("aab502"); // ���� ģ����ѯ
		Object aab506 = this.get("aab506"); // ��ͨ���򾫻���
		Object aab101 = this.get("aab101");
		int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append(" select b.aab501,b.aab101,a.aab102,a.aab105,b.aab502,")
				.append("	     b.aab504,b.aab505,b.aab506,b.aab507")
				.append("   from ab05 b,ab01 a")
				.append("  where b.aab101=a.aab101 ")
				;
		// �����б�
		List<Object> paramList = new ArrayList<>();
		// ��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		StringBuilder whereSql = new StringBuilder();
		if (this.isNotNull(aab502)) 
		{
			sql.append(" and b.aab502 like ?");
			whereSql.append(" and b.aab502 like ?");
			paramList.add("%" + aab502 + "%");
		}
		if (this.isNotNull(aab506) && aab506.equals("1")) 
		{
			sql.append(" and b.aab506=?");
			whereSql.append(" and b.aab506=?");
			paramList.add(aab506);
		}
		sql.append(" order by b.aab504 desc ");
		
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Map<String, Object> map1 = new HashMap<String, Object>();
		if (aab101 != null) 
		{
			map1.put("aab107", ab01.queryPersonEmp(aab101).get("aab107"));
		}
		else 
		{
			map1.put("aab107", "0");
		}
		map1.put("floor", String.valueOf(countFloor("ab05 b",whereSql.toString(),paramList.toArray())));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		sql.append(" limit ?,10 ");
		paramList.add((nowFloor-1)*10);
		List<Map<String, Object>> list = this.queryForList(sql.toString(), paramList.toArray());
		for(Map<String, Object> post:list)
		{
			rows.add(post);
		}
		return rows;
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
		String sql0 = "delete from ab11 where aab501=?";
		String sql1 = "delete from ab06 where aab501=?";
		String sql2 = "delete from ab07 where aab501=?";
		String sql3 = "delete from ab05 where aab501=?";
		this.apppendSql(sql0, aab501);
		this.apppendSql(sql1, aab501);
		this.apppendSql(sql2, aab501);
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
		Object aab507 = this.get("apaab507");
		System.out.println(aab507);
		if (this.isNotNull(aab101) && this.isNotNull(aab502) && this.isNotNull(aab503)
				&& !aab503.equals("<p><br></p>")) 
		{
			StringBuilder sql = new StringBuilder()
					.append(" insert into ab05(aab101,aab502,aab503,aab504,aab505,")
					.append("                  aab506,aab507)")
					.append("           values(?,?,?, current_timestamp(),'0',")
					.append("                  '0',?)");
			Object args[] = 
				{ 		aab101,
						aab502, 
						aab503,
						aab507
				};

			Boolean tag = this.executeUpdate(sql.toString(), args) > 0;
			Ab01ServicesImpl ab01=new Ab01ServicesImpl();
			ab01.addExp(aab101, "addPost");
			return tag;

		}
		return false;
	}

	/**
	 * ָ�����Ӳ�ѯ�������
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> postFindById() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aab501 = this.get("aab501"); // ����ID
		Object aab101 = this.get("aab101"); // �Ñ�ID
		int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		return postFindById(aab101 ,aab501 ,nowFloor);
	}

	/**
	 * ָ�����Ӳ�ѯ����(���� �ظ� �ղ�״̬)
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> postFindById(Object aab101 , Object aab501, int nowFloor) throws Exception 
	{
		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab101,a.aab102,a.aab105,b.aab502,b.aab503,")
				.append("        b.aab504,b.aab507")
				.append("   from ab01 a,ab05 b")
				.append("  where b.aab501=? and a.aab101=b.aab101")
				.append("  order by b.aab504")
				;
		// �����б�
		List<Map<String, Object>> rows =  new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Ab07ServicesImpl ab07=new Ab07ServicesImpl();
		Ab11ServicesImpl ab11=new Ab11ServicesImpl();
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		map1.put("collection", ab07.queryCollection(aab101,aab501).toString());				//�ղؠ�̬
		map1.put("like", ab11.countUserLike(aab101,aab501).toString());						//���ޠ�̬
		map1.put("nowFloor", String.valueOf(nowFloor));
		if(aab101 != null)
		{
			map1.put("aab107", ab01.queryPersonEmp(aab101).get("aab107"));					//����ֵ
		}
		else
		{
			map1.put("aab107", "0");
		}
				
		map1.put("countlike",ab11.countLike(aab501).get("countlike")); 						//������
		String whereSql = " and b.aab501=?";
		map1.put("floor", String.valueOf(countFloor("ab06 b",whereSql,aab501)));
		rows.add(map1);
		rows.add(queryForMap(sql.toString(), aab501));
		Ab06ServicesImpl ab06=new Ab06ServicesImpl();
		List<Map<String, Object>> commentList = ab06.commentFindById(aab501,(nowFloor-1)*10);
		for(Map<String, Object> comment:commentList)
		{
			rows.add(comment);
		}
		return rows;
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
			Ab01ServicesImpl ab01=new Ab01ServicesImpl();
			ab01.addExp(aab101, "addComment");
			return tag;
		}
		return false;
	}

	/**
	 * �����û���ʷ����
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> queryHistory() throws Exception 
	{
		// 1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab501,a.aab502,a.aab504,a.aab505 ")
				.append("   from ab05 a ")
				.append("  where a.aab101=? ")
				.append("  order by a.aab504 desc ")
				.append(" limit ?,10 ");
				;
				List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
				Map<String, Object> map1 = new HashMap<String, Object>();
				int nowFloor =  1;
				if (isNotNull(this.get("nowFloor"))) 
				{
					nowFloor = Integer.valueOf((String)this.get("nowFloor"));
				}
		    	map1.put("floor", String.valueOf(countFloor("ab05 a"," and a.aab101=?",this.get("aab101"))));
				map1.put("nowFloor", String.valueOf(nowFloor));
				rows.add(map1);
				Object args[]={
								this.get("aab101"),
								(nowFloor-1)*10
								};
				for(Map<String, Object> comment:this.queryForList(sql.toString(), args))
				{
					rows.add(comment);
				}
				return rows;
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
}
