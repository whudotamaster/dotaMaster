package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac05ServicesImpl extends JdbcServicesSupport 
{

	 /**
	   * װ����Ϣ������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aac502=this.get("qaac502");     //����  ģ����ѯ
	  	
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac501,aac502,aac503,aac504,aac505")
	  				.append("		 from ac05 ")
	  				;  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aac502))
	  		{
	  			sql.append(" where aac502 like ?");
	  			paramList.add("%"+aac502+"%");
	  		}				
	  		sql.append(" order by aac502");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	
	
	/**
	 * ���һ��װ��
	 * @return
	 * @throws Exception
	 */
	private boolean addEquipment()throws Exception
    {		
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac05 (aac502,aac503,aac504,aac505)   ")
    			.append("            values(?,?,?,?)           ")            
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac502"),
    			this.get("aac503"),
    			this.get("aac504"),
    			this.get("aac505"),
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	/**
	 * װ����������ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteEquipment()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from ac05 where aac501=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }
	
	/**
	 * ��һʵ��ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean deleteByIdEquipment()throws Exception
    {
    	String sql="delete from ac05 where aac501=?";
    	return this.executeUpdate(sql, this.get("aac501"))>0;
    }
	
	
	 /**
	   * װ����Ϣ������ֲ�ѯ
	 * @return
	 * @throws Exception
	 */
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select  aac502,aac503,aac504,aac505")
	  				.append("		 from ac05 ")
	    			.append(" where aac501=?")
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aac501"));
	    }
	 
	 
	 /**
	  * �޸�װ������
	 * @return
	 * @throws Exception
	 */
	private boolean modifyEquipment()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac05 set aac502=?,aac503=?,aac504=?,aac505=?  ")
	    			.append("                  where aac501=?                       ")
	    			;
	    	Object args[]={
	    			this.get("aac502"),
	    			this.get("aac503"),
	    			this.get("aac504"),
	    			this.get("aac505"),
	    			this.get("aac501")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	 
}
