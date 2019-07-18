package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac07ServicesImpl extends JdbcServicesSupport
{

	/**
	 * ������Ϣ������ģ����ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> query() throws Exception 
	{
		// ��ԭҳ���ѯ����
		Object aac702 = this.get("qaac702"); // ���� ģ����ѯ

		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select aac701,aac702,aac703,aac704,aac705,")
				.append("		aac706")
				.append("		 from ac07 ")
				.append("		 order by aac705 desc ")
				;

		// �����б�
		List<Object> paramList = new ArrayList<>();
		// ��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		if (this.isNotNull(aac702)) {
			sql.append(" where aac702 like ?");
			paramList.add("%" + aac702 + "%");
		}

		return this.queryForList(sql.toString(), paramList.toArray());
	}

	/**
	 * ���һ��������Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addEvent() throws Exception
	{
		// 1.��дSQL���
		StringBuilder sql = new StringBuilder()
				.append(" insert into ac07 (aac702,aac703,aac704,aac705,aac706)")
				.append("                   values(?,?,?,?,?) ")
				;
		// 2.��д��������
		Object args[] = { 
				this.get("aac702"),
				this.get("aac703"), 
				this.get("aac704"), 
				this.get("aac705"),
				this.get("aac706")
				};
		return this.executeUpdate(sql.toString(), args) > 0;
	}

	/**
	 * ���±�����Ϣ������ֲ�ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findById() throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" select  aac702,aac703,aac704,aac705,aac706 ,aac701 ")
				.append("         from ac07                                 ")
				.append("	     where aac701=?                             ");
		return this.queryForMap(sql.toString(), this.get("aac701"));
	}

	/**
	 * ������Ϣ��������������
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> FBIforMore() throws Exception
	{
		// 1.��дSQL���
		StringBuilder sql = new StringBuilder()
				.append(" select x.aac1101,x.aac701,x.aac1102,x.aac1103,x.aac1104,x.aac1105,y.aac702  ")
				.append("             from ac11 x , ac07 y                                  ")
				.append("			 where x.aac701=y.aac701                                ")
				.append("			 and x.aac701=?                                         ");
		// ִ�в�ѯ
		return this.queryForList(sql.toString(), this.get("aac701"));
	}

	/**
	 * �޸�Ӣ������
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean modifyEvent() throws Exception {
		StringBuilder sql = new StringBuilder()
				.append(" update ac07  set  aac702=?,aac703=?,aac704=?,aac705=?,aac706=? ")
				.append("                  where aac701=? ");
		Object args[] = { 
				this.get("aac702"), 
				this.get("aac703"), 
				this.get("aac704"), 
				this.get("aac705"),
				this.get("aac706"), 
				this.get("aac701")
				};
		return this.executeUpdate(sql.toString(), args) > 0;

	}
}
