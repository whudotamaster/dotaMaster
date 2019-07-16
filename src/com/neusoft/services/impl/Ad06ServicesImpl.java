package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad06ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>> query(Object aab101) throws Exception
	{
		String sql="select * from ad06 where aab101=? and aad604=0";
		return this.queryForList(sql,aab101);
	}
	
}
