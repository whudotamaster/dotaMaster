package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ad01ServicesImpl extends JdbcServicesSupport 
{
	//�û�������ҳʱ,�鿴��ǰ�Ƿ��п�Ѻע�ı���
	public List<Map<String, String>> query()throws Exception
    {
		
		StringBuilder sql=new StringBuilder()
  				.append("select d.aad101,d.aad102,d.aad103,c.aac1101,")
  				.append("       c.aac1102,c.aac1103,c.aac1104,e.aac702")
  				.append("  from ac11 c,ad01 d,ac07 e")
  				.append(" where d.aac1101=c.aac1101 and e.aac701=c.aac701 ")
  				.append("   and now()>d.aad104 and now()<d.aad105")
  				;
		return this.queryForList(sql.toString());
    }
	
	private boolean isEnough(Object aab101) throws Exception
	{
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double aab106=ab01.getMoney(aab101);
		int aad202=Integer.parseInt(this.get("aad202").toString());
		int aad203=Integer.parseInt(this.get("aad203").toString());
		if(aab106>aad202+aad203)
			return true;
		else 
			return false;
	}
	
    //�û�����Ѻעʱ,�����û�Ѻע�����¾��±�
    public boolean insertBetLog()throws Exception	
    {	
    	if(!this.isEnough(this.get("aab101")))
    	{	this.setMessage("��Ǯ����");
    		return false;
    	}
    	//ͨ��ǰ̨��������id���������ݿ�����ҵ���������
    	
    	//���뵥��Ѻע��Ϣ
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad101,aab101,aad202,aad203)")
    			.append("          values(?,?,?,?)")
    			;
    	Object args1[]={
    			this.get("aad101"),
    			this.get("aab101"),
    			this.get("aad202"),
    			this.get("aad203")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	//�۳��û����
    	int aab106=0-Integer.parseInt(this.get("aad202").toString())-Integer.parseInt(this.get("aad203").toString());
    	Ab01ServicesImpl ab01=new Ab01ServicesImpl();
    	ab01.updateMoney(aab106, this.get("aab101"));
    	
    	//ͨ������ID���Ҿ��������Ϣ������dto��
    	this.findDataById();

    	
    	//���¾����ܶ�
    	StringBuilder sql2=new StringBuilder()
    			.append("update ad01 ")
    			.append("   set aad102=aad102+?,aad103=aad103+?")
    			.append(" where aad101=?")
    			;
    	Object args2[]={
    			this.get("aad202"),
    			this.get("aad203"),
    			this.get("aad101")
    	};
    	this.apppendSql(sql2.toString(), args2);
    	return this.executeTransaction();
    }
    
    //��ѯ�����ܶ�
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
    
    //����ID�����������ݲ�����dto��
    private void findDataById() throws Exception
    {
    	String sql="select * from ad01 where aad101=?";
    	System.out.println(this.get("aad101"));
    	Map<String, String> map=this.queryForMap(sql,this.get("aad101"));
    	System.out.println(map);
    	this.put("aac1101", map.get("aac1101"));
    	this.put("aad102", map.get("aad102"));
    	this.put("aad103", map.get("aad103"));
    	this.put("aad104", map.get("aad104"));
    	this.put("aad105", map.get("aad105"));
    	
    	
    }
    
    //��ѯÿһ��ָ������Ѻע
    private List<Map<String,String>> queryUserCount(Object aad101)throws Exception
    {		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select aab101,aad202,aad203")
  				.append("  from ad02")
  				.append(" where aad101=?")
  				;
  		return this.queryForList(sql.toString(),aad101);
    }

    //���±������ʱ,������Ѻע������û�
    public boolean grantReward(Object aac1105,Object aac1101)throws Exception
    {
    	boolean tag=false;
    	if(aac1105.equals("1"))
    	{
    		tag=true;
    	}

    	String sql="select aad101 from ad01 where aac1101=?";

    	Map<String, String> temp=this.queryForMap(sql,aac1101);

    	Object aad101=temp.get("aad101");
    	
    	//2,��ȡѺע�ܶ�
    	Map<String, String> map=this.queryAllCount(aad101);
    	double countA=Double.parseDouble(map.get("aad102"));
    	double countB=Double.parseDouble(map.get("aad103"));
    	
    	//3,���ݾ���ID��ȡѺע�û�
    	//3.1��ȡ�û�Ѻע�б�
    	//list���������û�ID ѺעA������ ѺעB������ �˴���Ҫ������û�׬�Ķ�� ���ҷ���ÿһ��map��
    	List<Map<String, String>> list=this.queryUserCount(aad101);
    	
    	//3.2���ݱ���ʤ���������û��õ���õĽ��,������map��
    	if(tag)
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad202"));
    			m.put("aad204", String.valueOf((tem+tem*countB/countA)*0.95));//�����û��Ƿ�Ϊ��Ա�۷���ʱδ��
    		}
    	}
    	else
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad203"));
    			m.put("aad204", String.valueOf((tem+tem*countB/countA)*0.95));
    			
    		}
    	}
    	
    	//4,���ÿһ��Ѻע,���û����и��½��
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
			Tools.sendMessage("����һ��Ѻע���������,����õĽ����"+m.get("aad204"),(Object)m.get("aab101"));
		}
    	return this.executeTransaction();
    }
}