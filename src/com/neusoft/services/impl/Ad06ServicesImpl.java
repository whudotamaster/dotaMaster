package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ad06ServicesImpl extends JdbcServicesSupport 
{
//���һ����Ϣ
	public boolean insertNotice(String text,Object userId)throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("insert into ad06")
    			.append("(aab101,aad602,aad603,aad604)") 	
    			.append("values (?,?,current_timestamp(),0)")//���Ѷ�״̬����Ϊ0δ��
       			;
    	List<Object> paramList =new ArrayList<>();
    	paramList.add(userId);
    	paramList.add(text);
    	return this.executeUpdate(sql.toString(), paramList.toArray())>0;
	}
	public List<Map<String, String>> query(Object aab101) throws Exception
	{
		String sql="select * from ad06 where aab101=? and aad604=0 order by aad603 desc";
		return this.queryForList(sql,aab101);
	}
	//�û��ֶ��㿪 �б�չʾ���Զ��ı��Ѷ�״̬
	public List<Map<String, String>> queryNotice() throws Exception
	{
		Object aab101 = this.get("aab101");
		String sql="select * from ad06 where aab101=? and aad604=0 order by aad603 desc";
		List<Map<String,String>> ret = this.queryForList(sql,aab101);
		String sql2="update ad06 set aad604 = 1 where aab101 = ? and aad604 = 0";//���ó�1�Ѷ�
		this.executeUpdate(sql2, aab101);
		return ret;
	}
	
	//�û��ֶ��㿪 ��ʷ��Ϣ�б�չʾ
	public List<Map<String, String>> queryHistory() throws Exception
	{
		Object aab101 = this.get("aab101");
		String sql="select * from ad06 where aab101=? and aad604=1 order by aad603 desc";
		return this.queryForList(sql,aab101);
	}
	
	//����Ա����ʱ��˳���б�����Ͷ��
//		public List<Map<String,String>> adminQueryComplain()throws Exception
//		{
//		  		//����SQL����
//		  		StringBuilder sql=new StringBuilder()		  			
//		  				.append("  SELECT a.aad601,a.aab101,a.aad602,a.aad603,a.aad604,a.aad605,b.aab102  ")  
//		  				.append("    FROM ad06 a ,ab01 b")
//		  				.append("   WHERE a.aad604=1 and b.aab101=a.aab101 ")//504�����Ϊ1
//	  			    	.append(" ORDER BY a.aad605 DESC")//����Ͷ��ʱ�併������
//		  				;
//		  		return this.queryForList(sql.toString());  	
//		  }
//	//findbyidչʾͶ��ҳ��
//		public Map<String,String> findById()throws Exception
//	    {
//	    	//1.��дSQL���
//	    	StringBuilder sql =new StringBuilder()
//	    			.append(" SELECT a.aad601,a.aab101,a.aad602,a.aad603,a.aad604,a.aad605 ,b.aab102   ")   
//	    			.append("   FROM ad06 a ,ab01 b")
//	  				.append("  WHERE a.aad601=? and b.aab101=a.aab101 ")//PrincessConnectionRe-dive
//	    			;
//	    	//ִ�в�ѯ
//	    	return this.queryForMap(sql.toString(), this.get("aad601"));
//	    }
//	
//	
//	
////����Ա����Ͷ����� update
//	public boolean doneById()throws Exception
//	{
//		StringBuilder sql=new StringBuilder()
//				.append("UPDATE ad06 ")
//				.append("   SET aad604 = 2 , aad606 = current_timestamp()")
//				.append(" WHERE aad601 = ?")//ͨ��
//				;
//  		return this.executeUpdate(sql.toString(),this.get("aad601"))>0;
//	}
//	
//	public boolean undoneById()throws Exception
//	{
//		StringBuilder sql=new StringBuilder()
//				.append("UPDATE ad06 ")
//				.append("   SET aad604 = 3 , aad606 = current_timestamp()")
//				.append(" WHERE aad601 = ?")//��ͨ��
//				;
//  		return this.executeUpdate(sql.toString(),this.get("aad601"))>0;
//	}
//	
}
