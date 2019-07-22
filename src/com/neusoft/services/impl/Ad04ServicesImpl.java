package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
		
		String sql2="select aab101 from ad04 where aad401=?";
		
		Map<String, Object> map=this.queryForMap(sql2, this.get("aad401"));
		
		//2,发送信息
		Tools.sendMessage("您的饰品已经发送,请注意查看",map.get("aab101"));
		
		return this.executeUpdate(sql, this.get("aad401"))>0;
	}
	//查看待发货列表
	public List<Map<String, Object>> query()throws Exception
	{
		int number = 15 ;
		StringBuilder whereSql=new StringBuilder();
		StringBuilder sql=new StringBuilder()
				.append("select a.aad401,a.aac601,a.aab101,a.aad402,a.aad403,")
				.append("		a.aad404,a.aad405,b.fvalue,c.aac602,c.aac605")
				.append(" from  ad04 a,syscode b,ac06 c ")
				.append("where  a.aad403=0 and b.fname='aad403' and b.fcode=a.aad403 and a.aac601=c.aac601 order by a.aad405 desc")
				;
		whereSql.append("and a.aad403=0 and b.fname='aad403' and b.fcode=a.aad403 and a.aac601=c.aac601");
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		map1.put("floor", String.valueOf(countFloor("ad04 a,syscode b,ac06 c",whereSql.toString(),number,null)));
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
	//查看待发货订单详细信息
	public Map<String, Object> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aad401,a.aac601,a.aab101,a.aad402,a.aad403,")
				.append("		a.aad404,a.aad405,b.fvalue,c.aac602,c.aac605")
				.append(" from  ad04 a,syscode b,ac06 c ")
				.append("where  a.aad401=? and b.fname='aad403' and b.fcode=a.aad403 and a.aac601=c.aac601")
				;
		
		return this.queryForMap(sql.toString(), this.get("aad401"));
	}
}