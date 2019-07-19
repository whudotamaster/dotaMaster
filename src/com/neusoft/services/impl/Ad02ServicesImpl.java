package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ad02ServicesImpl extends JdbcServicesSupport 
{
	
	public List<Map<String, Object>> query()throws Exception
    {
		int number = 10 ;
		//比赛开始时间 战队1 战队2 押注A方 押注B方 获得货币
		StringBuilder whereSql=new StringBuilder();
		StringBuilder sql=new StringBuilder()
  				.append("select a.aac1102,a.aac1103,a.aac1104,b.aad202,")
  				.append("       b.aad203,b.aad204")
  				.append("  from ac11 a,ad02 b,ad01 c")
  				.append(" where c.aad101=b.aad101 and c.aac1101=a.aac1101 ")
  				.append("   and b.aab101=?")
  				;
		
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		whereSql.append("and b.aab101=?");
		map1.put("floor", String.valueOf(countFloor("ad02 b",whereSql.toString(),number,this.get("aab101"))));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		
		sql.append(" limit ?,? ");
		Object args[]={
				this.get("aab101"),
				(nowFloor-1)*number,
				number
				};
		
		return this.queryForList(sql.toString(),args);
    }
}