package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ac06ServicesImpl extends JdbcServicesSupport 
{
	
	//ʹ��������ҹ�����Ʒ
	public boolean buyAccessories()throws Exception
    {
		//
		//this.put("aac601", 1);
		//this.put("aab101", 1);
		//1,������ƷID��ѯ��Ʒ������Ϣ
		Map<String, String> acc=this.findAccessories(this.get("aac601"));
		
		//û�п�湺��ʧ��
		if(Integer.parseInt(acc.get("aac606"))==0)
		{
			return false;
		}
		
		//2,�����û�ID ��ѯ�û����
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		
		//�û���Ҳ���,����ʧ��
		if(money<Double.parseDouble(acc.get("aac605")))
		{
			return false;
		}
		
		//3,�����û����,�����������Բ��� ֻ�����±�дsql���
    	StringBuilder sql1=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106-?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			acc.get("aac605"),
    			this.get("aab101")
    	};
		this.apppendSql(sql1.toString(), args);
		
		//4,������Ʒ���
		String sql2="update ac06 set aac606=aac606-1 where aac601=?";
		this.apppendSql(sql2, this.get("aac601"));
		
		//5,����������б�
		StringBuilder sql3=new StringBuilder()
    			.append("insert into ad04(aac601,aab101,aad402,aad403,aad404) ")
    			.append("          values(?,?,?,?,?)")
    			;
		Object args3[]=
			{
				this.get("aac601"),
				this.get("aab101"),
				this.get("aad402"),
				0,//���״̬Ĭ�ϸ�ֵΪ0
				this.get("aad404")				
			};
		this.apppendSql(sql3.toString(),args3);
		
		return this.executeTransaction();
    }
	
	//������Ʒ����վ
	public boolean sellAccessories()throws Exception
	{
		String sql="insert into ad03(aac601,aab101,aad302,aad303,aad304) values(?,?,?,?,?)";
		Object args[]=
			{
					this.get("aac601"),
					this.get("aab101"),
					this.get("aad302"),
					0,
					this.get("aad304")
			};
		
		return this.executeUpdate(sql, args)>0;
		
	}
	
	//������ƷID����������Ϣ
	public Map<String, String> findAccessories(Object aac601) throws Exception
	{
		//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac601,a.aac602,a.aac603,a.aac604,a.aac605,a.aac606,")
    			.append("       a.aac101")
    			.append("  from ac06 a")
    			.append(" where a.aac601=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), aac601);
	}
	
	
	
	/**
	   * ��Ʒ��Ϣ������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aac602=this.get("qaac602");     //����  ģ����ѯ
	  	
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()

	  				.append("select x.aac601,x.aac602,x.aac603,x.aac604,x.aac605,x.aac606")
	  				.append("		 from ac06 x ,ac01 y")
	  				.append("        where x.aac101=y.aac101   ")
	  				;  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aac602))
	  		{
	  			sql.append(" where aac602 like ?");
	  			paramList.add("%"+aac602+"%");
	  		}				
	  		sql.append(" order by aac602");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	
	
	/**
	   * ��Ʒ��Ϣ��һʵ����ѯ
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql1=new StringBuilder()
    			.append("select x.aac602,x.aac603,x.aac604,x.aac605,x.aac606,y.aac102")
  				.append("		 from ac06 x ,ac01 y")
  				.append("        where x.aac101=y.aac101   ")
  				.append("         and aac601= ? ")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql1.toString(), this.get("aac601"));
    }
	
}