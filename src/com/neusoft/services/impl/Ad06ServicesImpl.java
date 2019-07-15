package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad06ServicesImpl extends JdbcServicesSupport 
{
//添加一条消息
	public boolean insertNotice()throws Exception
	{
    	Object aab101 = this.get("aab101");
    	Object aad602 = this.get("aad602");
    	Object aad603 = this.get("aad603");

		StringBuilder sql=new StringBuilder()
    			.append("insert into ad06")
    			.append("(aab101,aad602,aad603,aad604,aad605,aad606)") 	
    			.append("values (?,?,?,1,current_timestamp(),current_timestamp())")//将审核状态设置为1
       			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(aab101);
    	paramList.add(aad602);
    	paramList.add(aad603);
    	return this.executeUpdate(sql.toString(), paramList.toArray())>0;
	}
	
	public List<Map<String, String>> query(Object aab101) throws Exception
	{
		String sql="select * from ad06 where aab101=? and aad604=0";
		return this.queryForList(sql,aab101);
	}
	//管理员按照时间顺序列表待审核投诉
//		public List<Map<String,String>> adminQueryComplain()throws Exception
//		{
//		  		//定义SQL主体
//		  		StringBuilder sql=new StringBuilder()		  			
//		  				.append("  SELECT a.aad601,a.aab101,a.aad602,a.aad603,a.aad604,a.aad605,b.aab102  ")  
//		  				.append("    FROM ad06 a ,ab01 b")
//		  				.append("   WHERE a.aad604=1 and b.aab101=a.aab101 ")//504待审核为1
//	  			    	.append(" ORDER BY a.aad605 DESC")//按照投诉时间降序排列
//		  				;
//		  		return this.queryForList(sql.toString());  	
//		  }
//	//findbyid展示投诉页面
//		public Map<String,String> findById()throws Exception
//	    {
//	    	//1.编写SQL语句
//	    	StringBuilder sql =new StringBuilder()
//	    			.append(" SELECT a.aad601,a.aab101,a.aad602,a.aad603,a.aad604,a.aad605 ,b.aab102   ")   
//	    			.append("   FROM ad06 a ,ab01 b")
//	  				.append("  WHERE a.aad601=? and b.aab101=a.aab101 ")//PrincessConnectionRe-dive
//	    			;
//	    	//执行查询
//	    	return this.queryForMap(sql.toString(), this.get("aad601"));
//	    }
//	
//	
//	
////管理员处理投诉意见 update
//	public boolean doneById()throws Exception
//	{
//		StringBuilder sql=new StringBuilder()
//				.append("UPDATE ad06 ")
//				.append("   SET aad604 = 2 , aad606 = current_timestamp()")
//				.append(" WHERE aad601 = ?")//通过
//				;
//  		return this.executeUpdate(sql.toString(),this.get("aad601"))>0;
//	}
//	
//	public boolean undoneById()throws Exception
//	{
//		StringBuilder sql=new StringBuilder()
//				.append("UPDATE ad06 ")
//				.append("   SET aad604 = 3 , aad606 = current_timestamp()")
//				.append(" WHERE aad601 = ?")//不通过
//				;
//  		return this.executeUpdate(sql.toString(),this.get("aad601"))>0;
//	}
//	
}
