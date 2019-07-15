package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ad02ServicesImpl extends JdbcServicesSupport 
{
	
	public List<Map<String, String>> query()throws Exception
    {
		//比赛开始时间 战队1 战队2 押注A方 押注B方 获得货币
		StringBuilder sql=new StringBuilder()
  				.append("select a.aac1102,a.aac1103,a.aac1104,b.aad202,")
  				.append("       b.aad203,b.aad204")
  				.append("  from ac11 a,ad02 b,ad01 c")
  				.append(" where c.aad101=b.aad101 and c.aac1101=a.aac1101 ")
  				.append("   and b.aab101=?")
  				;
		return this.queryForList(sql.toString(),this.get("aab101"));
    }
}