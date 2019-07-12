package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.jmx.snmp.tasks.ThreadService;

public class Ab08ServicesImpl extends JdbcServicesSupport 
{
	
	 /**
	   * ���²�ѯ ������
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab802=this.get("qaab802");     //����  ģ����ѯ
	  		//����SQL����
	  		StringBuilder sql1=new StringBuilder()
	  				.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
	  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
	  				.append("  		   from ab08 x ,ab01 y                          ")
	  				.append("        where x.aab101=y.aab101 and x.aab804 = 2   ")//804�����ͨ��Ϊ2
	
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList1=new ArrayList<>();
	  		
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aab802))
	  		{
	  			sql1.append("  and aab802 like ? ");
  			    paramList1.add("%"+aab802+"%");	
  		    }  				
	  		sql1.append(" order by aab805 desc ");//����ʱ�併������
	  		return this.queryForList(sql1.toString(), paramList1.toArray());  	
	  		
	  }
	
	//����Ա��ѯ���������
	public List<Map<String,String>> adminQuery()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab802=this.get("qaab802");     //����  ģ����ѯ
	  		//����SQL����
	  		StringBuilder sql1=new StringBuilder()
	  				.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
	  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
	  				.append("  		   from ab08 x ,ab01 y                          ")
	  				.append("        where x.aab101=y.aab101 and x.aab804 = 1   ")//804�����Ϊ2
	
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList1=new ArrayList<>();
	  		
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aab802))
	  		{
	  			sql1.append("  and aab802 like ? ");
			    paramList1.add("%"+aab802+"%");	
		    }  				
	  		sql1.append(" order by aab805 desc ");//����ʱ�併������
	  		return this.queryForList(sql1.toString(), paramList1.toArray());  	
	  		
	  }
	
	public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql1=new StringBuilder()
    			.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
  				.append("  		   from ab08 x ,ab01 y                          ")
  				.append("        where x.aab101=y.aab101    ")
  				.append("         and aab801= ? ")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql1.toString(), this.get("aab801"));
    }
	
	/**
	 * ��������
	 * @return
	 * @throws Exception
	 */
	private boolean addArticle()throws Exception
    {		
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("  insert into ab08 (aab101,aab802,aab803,aab804,  ")
    			.append("                   aab805,aab806)               ")
    			.append("                   values(?,?,?,1,            ")
    			.append("                   CURRENT_TIMESTAMP(),?)     ")                    
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aab101"),
    			this.get("aab802"),
    			this.get("aab803"),
    
    			this.get("aab806"),
    			
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	/**
	 * ���µ�һɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean deleteByIdArticle()throws Exception
    {
    	String sql="delete from ab08 where aab801=?";
    	return this.executeUpdate(sql, this.get("aab801"))>0;
    }
	
	//�������ͨ���Ͳ�ͨ��
	private boolean passArticle()throws Exception
	{
		String sql="update ab08 set aab804 = 2 where aab801=?";
		return this.executeUpdate(sql, this.get("aab801"))>0;//2==ͨ��
	}
	
	private boolean unpassArticle()throws Exception
	{
		String sql="update ab08 set aab804 = 3 where aab801=?";
		return this.executeUpdate(sql, this.get("aab801"))>0;//3==��ͨ�� ����������Ϣ��ʾ��
	}
	
	/**
	 * ��������ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteArticle()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from ab08 where aab801=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }
}