
package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
		int number = 15 ;
		StringBuilder sql=new StringBuilder()
				.append("select * from ad06 where aab101=? order by aad604,aad603 desc");
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		map1.put("floor", String.valueOf(countFloor("ad06","and aab101=?",number,aab101)));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		sql.append(" limit ?,? ");
		Object args1[]={
				this.get("aab101"),
				(nowFloor-1)*number,
				number
				};
		List<Object> paramList =new ArrayList<>();
		for(Map<String, Object> list:this.queryForList(sql.toString(), args1))
		{
			rows.add(list);
			paramList.add(list.get("aad601")); 
		}
		String sql2="update ad06 set aad604 = 1 where aad601=?";//设置成1已读
		batchUpdate(sql2, paramList.toArray());
		return rows;
	}
	
	
}

