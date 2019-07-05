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
		//1,������ƷID��ѯ��Ʒ������Ϣ
		Map<String, String> acc=this.findAccessories();
		//û�п�湺��ʧ��
		if(Integer.parseInt(acc.get("aac606"))==0)
		{
			return false;
		}
		
		//2,�����û�ID ��ѯ�û����
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Map<String, String> user=ab01.findById();
		
		//�û���Ҳ���,����ʧ��
		if(Integer.parseInt(user.get("aab106"))<Integer.parseInt(acc.get("aac605")))
		{
			return false;
		}
		
		//3,�����û����
		ab01.updateMoney(-Integer.parseInt(acc.get("aac605")),this.get("aab101"));
		
		//4,������Ʒ���
		String sql="update ac06 set aac606=aac606-1 where aac601=?";
		
		this.apppendSql(sql, this.get("aac601"));
		//5,����������б�
		StringBuilder sql2=new StringBuilder()
    			.append("insert into ad04(aac601,aab101,aab402,aad403,aad404 ")
    			.append("          values(?,?,?,?,?")
    			;
		Object args[]=
			{
				this.get("aac601"),
				this.get("aab101"),
				this.get("aab402"),
				this.get("aab403"),
				this.get("aab404")				
			};
		this.apppendSql(sql2.toString(),args);
		
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
					this.get("aad303"),
					this.get("aad304")
			};
		
		return this.executeUpdate(sql, args)>0;
		
	}
	
	//������ƷID����������Ϣ
	public Map<String, String> findAccessories() throws Exception
	{
		//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab601,a.aab602,a.aab603,a.aab604,a.aab605,a.aab606,")
    			.append("       a.aac101")
    			.append("  from ac06 a")
    			.append(" where a.aac601=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aac601"));
	}
}