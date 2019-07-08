package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ad04ServicesImpl extends JdbcServicesSupport 
{
	
	//����
	public boolean sendDelivery() throws Exception
	{
		//1,���·���״̬Ϊ�����
		String sql="update ad04 set aad403=1 where aad401=?";	
		//2,������Ϣ
		Tools.sendMessage("������Ʒ�Ѿ�����,��ע��鿴",this.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad401"))>0;
	}
	
	public List<Map<String, String>> queryAllDelivery()throws Exception
	{
		String sql="select aad401,aac601,aab101,aad402,aad403,aad404 from ad04 where aad403=0";
		return this.queryForList(sql);
	}
	
	public Map<String, String> findDelivery()throws Exception
	{
		String sql="select aad401,aac601,aab101,aad402,aad403,aad404 from ad04 where aad401=?";
		return this.queryForMap(sql, this.get("aad401"));
	}
	
}