package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac11ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String, String>> query()throws Exception
    {
		StringBuilder sql=new StringBuilder()
  				.append("select a.aac1101,b.aac702,a.aac1102,a.aac1103,a.aac1104")
  				.append("  from ac11 a,ac07 b")
  				.append(" where a.aac1105=0  and a.aac701=b.aac701")
  				;
		return this.queryForList(sql.toString());
    }
	
	public boolean announceResult()throws Exception
	{
		String sql="update ac11 set aac1105=? where aac1101=?";
		Object args[]=
			{
					this.get("aac1105"),
					this.get("aac1101")
			};
		
		this.executeUpdate(sql, args);
		
		Ad01ServicesImpl ad01=new Ad01ServicesImpl();
		return ad01.grantReward(this.get("aac1105"),this.get("aac1101"));
	}

}
