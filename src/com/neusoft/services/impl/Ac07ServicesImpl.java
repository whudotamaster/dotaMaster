package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
		int number = 10 ;
		// ��ԭҳ���ѯ����
				Object aac702 = this.get("qaac702"); // ���� ģ����ѯ

				// ����SQL����
				StringBuilder whereSql=new StringBuilder();
				StringBuilder sql = new StringBuilder()
						.append("select x.aac701,x.aac702,y.fvalue aac703,x.aac704,x.aac705,")
						.append("		x.aac706")
						.append("		 from ac07 x , syscode y ")
						.append("  where x.aac703=y.fcode and y.fname='aac703'");
						;

		// �����б�
		List<Object> paramList = new ArrayList<>();
		// ��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		if (this.isNotNull(aac702)) {
			whereSql.append(" and x.aac702 like ?");
			sql.append(" and x.aac702 like ?");
			paramList.add("%" + aac702 + "%");
		}
		sql.append("  order by x.aac705 desc");
		
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		map1.put("floor", String.valueOf(countFloor(" ac07 x",whereSql.toString(),number,paramList.toArray())));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		sql.append(" limit ?,? ");
		paramList.add((nowFloor-1)*number);
		paramList.add(number);
		for(Map<String, Object> list:this.queryForList(sql.toString(), paramList.toArray()))
		{
			rows.add(list);
		}
		return rows;
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
				.append(" select  x.aac702,x.aac703,x.aac704,x.aac705,x.aac706 ,x.aac701 ")
				.append("         from ac07 x, syscode y                                ")
				.append("	     where aac701=?                             ")
				.append("        and x.aac703=y.fcode and y.fname='aac703' ")
				;
		Map<String, Object> ins=this.queryForMap(sql.toString(), this.get("aac701"));
		String sql2="select aac1101,aac1102,aac1103,aac1104,aac1105 from ac11 where aac701=?";
		List<Map<String, Object>> rows=this.queryForList(sql2,this.get("aac701"));
		ins.put("rows", rows);
		System.out.println(ins);
		return ins;
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
