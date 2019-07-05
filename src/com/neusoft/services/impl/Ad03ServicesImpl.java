package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ad03ServicesImpl extends JdbcServicesSupport 
{
	public boolean checkDelFail() throws Exception
	{
		//1,�����ջ�״̬Ϊʧ��
		String sql="update ad03 set aad303=2 where aad301=?";
		
		//2,����ʧ����Ϣ���û�
		Tools.sendMessage("������Ʒδ�յ�,��������Ƿ��ʹ����δ����");
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	public boolean checkDelSuccess() throws Exception
	{
		//1,�����ջ�״̬Ϊ�����
		String sql="update ad03 set aad303=1 where aad301=?";
		
		
		//2,��ѯ��Ʒ�۸�
		Ac06ServicesImpl ac06=new Ac06ServicesImpl();
		Map<String, String> acc=ac06.findAccessories();
		Object price=acc.get("aac604");
		
		//3,�����û����
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		ab01.updateMoney(price,"aab101");//�˴���ҳ�洫�����ĳ�����Ʒ���û�ID
		
		//4,������Ϣ
		Tools.sendMessage("������Ʒ�Ѿ��յ�,����õĽ����"+price);
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	public List<Map<String, String>> queryAllDelivery()throws Exception
	{
		String sql="select aad301,aac601,aab101,aad302,aad303,aad304 from ad03 where aad303=0";
		return this.queryForList(sql);
	}
	
	public Map<String, String> findDelivery()throws Exception
	{
		String sql="select aad301,aac601,aab101,aad302,aad303,aad304 from ad03 where aad301=?";
		return this.queryForMap(sql, this.get("aad301"));
	}
	
}