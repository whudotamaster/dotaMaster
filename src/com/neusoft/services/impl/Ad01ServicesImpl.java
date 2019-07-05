package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ad01ServicesImpl extends JdbcServicesSupport 
{
   //�û�����Ѻעʱ,�����û�Ѻע�����¾��±�
    private boolean insertBetLog()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad101,aab101,aad202,aad203")
    			.append("          values(?,?,?,?")
    			;
    	Object args1[]={
    			this.get("aad101"),
    			this.get("aab101"),
    			this.get("aad202"),
    			this.get("aad203")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	StringBuilder sql2=new StringBuilder()
    			.append("update ad01 a")
    			.append("   set a.aad102=? and a.aad103=?")
    			.append(" where a.aad101=?")
    			;
    	Object args2[]={
    			this.get("aad102"),
    			this.get("aab103"),
    			this.get("aad101")
    	};
    	this.apppendSql(sql2.toString(), args2);
    	return this.executeTransaction();
    }
    
    private Map<String,String> queryAllCount(Object aad101)throws Exception
    {		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select aad102,aad103")
  				.append("  from ad01")
  				.append(" where aad101=?")
  				;
  		return this.queryForMap(sql.toString(), aad101);
    }
    
    private List<Map<String,String>> queryUserCount(Object aad101)throws Exception
    {		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select aab101,aad202,aad203")
  				.append("  from ad02")
  				.append(" where aad101=?")
  				;
  		return this.queryForList(sql.toString(), aad101);
    }

    //���±������ʱ,������Ѻע������û�
    private boolean grantReward()throws Exception
    {
    	//1,���±������
    	StringBuilder sql1=new StringBuilder()
    			.append("update ac11 a")
    			.append("   set a.aac1105=?")
    			.append(" where a.aac1101=?")
    			;
    	Object args1[]={
    			this.get("aac1105"),
    			this.get("aac1101")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	boolean tag=false;
    	if(Integer.parseInt(this.get("aac1105").toString())==1)
    	{
    		tag=true;
    	}
    	
    	//2,��ȡѺע�ܶ�
    	Map<String, String> map=this.queryAllCount(this.get("aad101"));
    	int countA=Integer.parseInt(map.get("aad102"));
    	int countB=Integer.parseInt(map.get("aad103"));
    	
    	//3,���ݾ���ID��ȡѺע�û�
    	//3.1��ȡ�û�Ѻע�б�
    	//list���������û�ID ѺעA������ ѺעB������ �˴���Ҫ������û�׬�Ķ�� ���ҷ���ÿһ��map��
    	List<Map<String, String>> list=this.queryUserCount(this.get("aad101"));
    	
    	//���ݱ���ʤ���������û��õ���õĽ��,������map��
    	if(tag)
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad202"));
    			map.put("aad204", String.valueOf((tem+tem/countA*countB)*0.95));//�����û��Ƿ�Ϊ��Ա�۷���ʱδ��
    		}
    	}
    	else
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad203"));
    			map.put("aad204", String.valueOf((tem+tem/countA*countB)*0.95));
    		}
    	}
    	
    	//���ÿһ��Ѻע,���û����и��½��
    	StringBuilder sql2=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;

    	for(Map<String, String> m:list)
		{
    		Object args[]=
    			{
    				m.get("aad204"),
    				m.get("aab101")
    			};
			this.apppendSql(sql2.toString(),args);
		}
    	

    	return this.executeTransaction();
    }
    
    
    
    
    
    
}