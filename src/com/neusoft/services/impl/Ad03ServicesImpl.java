package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.org.apache.xpath.internal.operations.And;

public class Ad03ServicesImpl extends JdbcServicesSupport 
{
	//���ʧ��
	public boolean checkDelFail() throws Exception
	{
		//1,�����ջ�״̬Ϊʧ��
		String sql="update ad03 set aad303=2 where aad301=?";
		
		String sql2="select aab101 from ad03 where aad301=?";
		
		Map<String, Object> map=this.queryForMap(sql2, this.get("aad301"));
		
		//2,����ʧ����Ϣ���û�
		Tools.sendMessage("������Ʒδ�յ�,��������Ƿ��ʹ����δ����",map.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	//��˳ɹ�
	public boolean checkDelSuccess() throws Exception
	{
		//1,�����ջ�״̬Ϊ�����
		String sql="update ad03 set aad303=1 where aad301=? ";
		
		this.apppendSql(sql, this.get("aad301"));
		
		//1.2���ݶ����ҵ��û�id
		String sql2="select aab101 from ad03 where aad301=?";
		
		Map<String, Object> map=this.queryForMap(sql2, this.get("aad301"));
		
		//2,��ѯ��Ʒ�۸�
		Ac06ServicesImpl ac06=new Ac06ServicesImpl();
		Map<String, Object> acc=ac06.findAccessories(this.get("aac601"));
		Object price=acc.get("aac604");
		
		//3,�����û����
    	StringBuilder sql3=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;
    	
    	Object args[]=
    		{
    			price,
    			map.get("aab101")	
    		};
    	this.apppendSql(sql3.toString(), args);
				
		//4,���¿��
		String sql4="update ac06 set aac606=aac606+1 where aac601=?";
		this.apppendSql(sql4, this.get("aac601"));
		
		//4,������Ϣ
		Tools.sendMessage("������Ʒ�Ѿ��յ�,����õĽ����:<m>"+price+"</m>",map.get("aab101"));
		
		return this.executeTransaction();
	}
	
	//�鿴���д��ջ��б���δ��ɵĶ���
	public List<Map<String, Object>> query()throws Exception
	{
		int number = 15 ;
		StringBuilder whereSql=new StringBuilder();
		StringBuilder sql=new StringBuilder()
						.append("select a.aad301,a.aac601,a.aab101,a.aad302,a.aad303,")
						.append("		a.aad304,a.aad305,b.fvalue,c.aac602,c.aac604")
						.append(" from  ad03 a,syscode b,ac06 c ")
						.append("where  a.aad303=0 and b.fname='aad303' and b.fcode=a.aad303 and a.aac601=c.aac601 order by a.aad305")
						;
						
		whereSql.append("and a.aad303=0 and b.fname='aad303' and b.fcode=a.aad303 and a.aac601=c.aac601");
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		map1.put("floor", String.valueOf(countFloor("ad03 a,syscode b,ac06 c",whereSql.toString(),number,null)));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		
		sql.append(" limit ?,? ");
			Object args[]={
								(nowFloor-1)*number,
								number
								};
		for(Map<String, Object> list:this.queryForList(sql.toString(), args))
		{
			rows.add(list);
		}
		return rows;
	}
	
	
	//�鿴���ջ��б�������ϸ��Ϣ
	public Map<String, Object> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aad301,a.aac601,a.aab101,a.aad302,a.aad303,")
				.append("		a.aad304,a.aad305,b.fvalue,c.aac602,c.aac604")
				.append(" from  ad03 a,syscode b,ac06 c ")
				.append("where  a.aad301=? and b.fname='aad303' and b.fcode=a.aad303 and a.aac601=c.aac601")
				;
		return this.queryForMap(sql.toString(), this.get("aad301"));
	}
	
}