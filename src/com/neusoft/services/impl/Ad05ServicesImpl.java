package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad05ServicesImpl extends JdbcServicesSupport 
{
//�û����Ͷ����� insert into ad05
	public boolean psnAddComplain()throws Exception
	{
    	Object aab101 = this.get("aab101");
    	Object aad502 = this.get("aad502");
    	Object aad503 = this.get("aad503");

		StringBuilder sql=new StringBuilder()
    			.append("insert into ad05")
    			.append("(aab101,aad502,aad503,aad504,aad505,aad506)") 	
    			.append("values (?,?,?,1,current_timestamp(),current_timestamp())")//�����״̬����Ϊ1
       			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(aab101);
    	paramList.add(aad502);
    	paramList.add(aad503);
    	return this.executeUpdate(sql.toString(), paramList.toArray())>0;
	}
	
	//����Ա����ʱ��˳���б�����Ͷ��
		public List<Map<String,String>> adminQueryComplain()throws Exception
		{
		  		//����SQL����
		  		StringBuilder sql=new StringBuilder()		  			
		  				.append("  SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505,b.aab102  ")  
		  				.append("    FROM ad05 a ,ab01 b")
		  				.append("   WHERE a.aad504=1 and b.aab101=a.aab101 ")//504�����Ϊ1
	  			    	.append(" ORDER BY a.aad505 DESC")//����Ͷ��ʱ�併������
		  				;
		  		return this.queryForList(sql.toString());  	
		  }
		
		public List<Map<String,String>> query()throws Exception
		{
		  		//����SQL����
		  		StringBuilder sql=new StringBuilder()		  			
		  				.append("  SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505,b.aab102  ")  
		  				.append("    FROM ad05 a ,ab01 b")
		  				.append("   WHERE a.aad504=1 and b.aab101=a.aab101 ")//504�����Ϊ1
	  			    	.append(" ORDER BY a.aad505 DESC")//����Ͷ��ʱ�併������
		  				;
		  		return this.queryForList(sql.toString());  	
		  }
	//findbyidչʾͶ��ҳ��
		public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql =new StringBuilder()
	    			.append(" SELECT a.aad501,a.aab101,a.aad502,a.aad503,a.aad504,a.aad505 ,b.aab102   ")   
	    			.append("   FROM ad05 a ,ab01 b")
	  				.append("  WHERE a.aad501=? and b.aab101=a.aab101 ")//PrincessConnectionRe-dive
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aad501"));
	    }
	
//����Ա����Ͷ����� update
	public boolean doneById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("UPDATE ad05 ")
				.append("   SET aad504 = 2 , aad506 = current_timestamp()")
				.append(" WHERE aad501 = ?")//ͨ��
				;
  		return this.executeUpdate(sql.toString(),this.get("aad501"))>0;
	}
	
	public boolean undoneById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("UPDATE ad05 ")
				.append("   SET aad504 = 3 , aad506 = current_timestamp()")
				.append(" WHERE aad501 = ?")//��ͨ��
				;
  		return this.executeUpdate(sql.toString(),this.get("aad501"))>0;
	}
	
}
