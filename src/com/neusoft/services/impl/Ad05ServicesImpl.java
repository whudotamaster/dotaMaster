package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad05ServicesImpl extends JdbcServicesSupport 
{
//用户添加投诉意见 insert into ad05
	public boolean psnAddComplain()throws Exception
	{
    	Object aab101 = this.get("aab101");
    	Object aad502 = this.get("aad502");
    	Object aad503 = this.get("aad503");

		StringBuilder sql=new StringBuilder()
    			.append("insert into ad05")
    			.append("(aab101,aad502,aad503,aad504,aad505,aad506)") 	
    			.append("values (?,?,?,1,current_timestamp(),current_timestamp())")//将审核状态设置为1
       			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(aab101);
    	paramList.add(aad502);
    	paramList.add(aad503);
    	return this.executeUpdate(sql.toString(), paramList.toArray())>0;
	}
	
	//管理员按照时间顺序列表待审核投诉
		public List<Map<String,String>> adminQueryComplain()throws Exception
		{
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()		  			
		  				.append("  SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505,b.aab102  ")  
		  				.append("    FROM ad05 a ,ab01 b")
		  				.append("   WHERE a.aad504=1 and b.aab101=a.aab101 ")//504待审核为1
	  			    	.append(" ORDER BY a.aad505 DESC")//按照投诉时间降序排列
		  				;
		  		return this.queryForList(sql.toString());  	
		  }
		
		public List<Map<String,String>> query()throws Exception
		{
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()		  			
		  				.append("  SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505,b.aab102  ")  
		  				.append("    FROM ad05 a ,ab01 b")
		  				.append("   WHERE a.aad504=1 and b.aab101=a.aab101 ")//504待审核为1
	  			    	.append(" ORDER BY a.aad505 DESC")//按照投诉时间降序排列
		  				;
		  		return this.queryForList(sql.toString());  	
		  }
	//findbyid展示投诉页面
		public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql =new StringBuilder()
	    			.append(" SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505 ,b.aab102   ")   
	    			.append("   FROM ad05 a ,ab01 b")
	  				.append("  WHERE a.aad501=? and b.aab101=a.aab101 ")//PrincessConnectionRe-dive
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aad501"));
	    }
	
//管理员处理投诉意见 update
	public boolean doneById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("UPDATE ad05 ")
				.append("   SET aad504 = 2 , aad506 = current_timestamp()")
				.append(" WHERE aad501 = ?")//通过
				;
  		return this.executeUpdate(sql.toString(),this.get("aad501"))>0;
	}
	
	public boolean undoneById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("UPDATE ad05 ")
				.append("   SET aad504 = 3 , aad506 = current_timestamp()")
				.append(" WHERE aad501 = ?")//不通过
				;
  		return this.executeUpdate(sql.toString(),this.get("aad501"))>0;
	}
	
}
