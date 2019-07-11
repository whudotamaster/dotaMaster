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
	
	//发货
	public boolean sendDelivery() throws Exception
	{
		//1,更新发货状态为已完成
		String sql="update ad04 set aad403=1 where aad401=?";	
		//2,发送信息
		Tools.sendMessage("您的饰品已经发送,请注意查看",this.get("aab101"));
		return this.executeUpdate(sql, this.get("aad401"))>0;
	}
	//查看待发货列表
	public List<Map<String, String>> query()throws Exception
	{
		String sql="select a.aad401,a.aac601,a.aab101,a.aad402,a.aad403,a.aad404,b.aac602 from ad04 a,ac06 b where a.aad403=0 and a.aac601=b.aac601";
		return this.queryForList(sql);
	}
	//查看待发货订单详细信息
	public Map<String, String> findById()throws Exception
	{
		String sql="select a.aad401,a.aac601,a.aab101,a.aad402,a.aad403,a.aad404,b.aac602,b.aac605 from ad04 a,ac06 b where a.aad401=? and a.aac601=b.aac601";
		return this.queryForMap(sql, this.get("aad401"));
	}
}