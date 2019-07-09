package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ad03ServicesImpl extends JdbcServicesSupport 
{
	//审核失败
	public boolean checkDelFail() throws Exception
	{
		//1,更新收货状态为失败
		String sql="update ad03 set aad303=2 where aad301=?";
		
		//2,发送失败消息给用户
		Tools.sendMessage("您的饰品未收到,请您检查是否发送错误或未发送",this.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	//审核成功
	public boolean checkDelSuccess() throws Exception
	{
		//1,更新收货状态为已完成
		String sql="update ad03 set aad303=1 where aad301=?";
		
		//2,查询饰品价格
		Ac06ServicesImpl ac06=new Ac06ServicesImpl();
		Map<String, String> acc=ac06.findAccessories(this.get("aac601"));
		Object price=acc.get("aac604");
		
		//3,更新用户金额
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		ab01.updateMoney(price,this.get("aab101"));//此处填页面传过来的出售饰品的用户ID
		
		//4,更新库存
		String sql2="update ac06 set aac606=aac606+1 where aac601=?";
		this.apppendSql(sql2, this.get("aac601"));
		
		//4,发送信息
		Tools.sendMessage("您的饰品已经收到,您获得的金额是"+price,this.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad301"))>0;
	}
	
	//查看所有待收货列表中未完成的订单
	public List<Map<String, String>> query()throws Exception
	{
		String sql="select aad301,aac601,aab101,aad302,aad303,aad304 from ad03 where aad303=0";
		return this.queryForList(sql);
	}
	
	
	//查看待收货列表订单的详细信息
	public Map<String, String> findById()throws Exception
	{
		String sql="select a.aad301,a.aac601,a.aab101,a.aad302,a.aad303,a.aad304,b.aac602 from ad03 a,ac06 b where a.aad301=? and a.aac601=b.aac601";
		return this.queryForMap(sql, this.get("aad301"));
	}
	
}