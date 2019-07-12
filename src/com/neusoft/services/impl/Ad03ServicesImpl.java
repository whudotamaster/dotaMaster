package com.neusoft.services.impl;

import java.util.ArrayList;
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
		
		//2,����ʧ����Ϣ���û�
		Tools.sendMessage("������Ʒδ�յ�,��������Ƿ��ʹ����δ����",this.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	//��˳ɹ�
	public boolean checkDelSuccess() throws Exception
	{
		//1,�����ջ�״̬Ϊ�����
		String sql="update ad03 set aad303=1 where aad301=?";
		
		//2,��ѯ��Ʒ�۸�
		Ac06ServicesImpl ac06=new Ac06ServicesImpl();
		Map<String, String> acc=ac06.findAccessories(this.get("aac601"));
		Object price=acc.get("aac604");
		
		//3,�����û����
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		ab01.updateMoney(price,this.get("aab101"));//�˴���ҳ�洫�����ĳ�����Ʒ���û�ID
		
		//4,���¿��
		String sql2="update ac06 set aac606=aac606+1 where aac601=?";
		this.apppendSql(sql2, this.get("aac601"));
		
		//4,������Ϣ
		Tools.sendMessage("������Ʒ�Ѿ��յ�,����õĽ����"+price,this.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	//�鿴���д��ջ��б���δ��ɵĶ���
	public List<Map<String, String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
						.append("select a.aad301,a.aac601,a.aab101,a.aad302,a.aad303,")
						.append("		a.aad304,a.aad305,b.fvalue,c.aac602,c.aac604")
						.append(" from  ad03 a,syscode b,ac06 c ")
						.append("where  a.aad303=0 and b.fname='aad303' and b.fcode=a.aad303 and a.aac601=c.aac601")
						;
						

		return this.queryForList(sql.toString());
	}
	
	
	//�鿴���ջ��б�������ϸ��Ϣ
	public Map<String, String> findById()throws Exception
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