
package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad06ServicesImpl extends JdbcServicesSupport 
{
//添加一条消息
	public boolean insertNotice(String text,Object userId)throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("insert into ad06")
    			.append("(aab101,aad602,aad603,aad604)") 	
    			.append("values (?,?,current_timestamp(),0)")//将已读状态设置为0未读
       			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(userId);
    	paramList.add(text);
    	return this.executeUpdate(sql.toString(), paramList.toArray())>0;
	}
	public List<Map<String, Object>> query(Object aab101) throws Exception
	{
		String sql="select aad601 from ad06 where aab101=? and aad604=0";
		return this.queryForList(sql,aab101);
	}
	//用户手动点开 列表展示并自动改变已读状态
	public List<Map<String, Object>> queryNotice() throws Exception
	{
		Object aab101 = this.get("aab101");
		String sql="select * from ad06 where aab101=? and aad604=0 order by aad603 desc";
		List<Map<String,Object>> ret = this.queryForList(sql,aab101);
		String sql2="update ad06 set aad604 = 1 where aab101 = ? and aad604 = 0";//设置成1已读
		this.executeUpdate(sql2, aab101);
		return ret;
	}
	
	//用户手动点开 历史消息列表展示
	public List<Map<String, Object>> queryHistory() throws Exception
	{
		Object aab101 = this.get("aab101");
		String sql="select * from ad06 where aab101=? and aad604=1 order by aad603 desc";
		return this.queryForList(sql,aab101);
	}
}

