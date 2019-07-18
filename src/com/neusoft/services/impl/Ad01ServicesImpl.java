package com.neusoft.services.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.HashMap;


import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
public class Ad01ServicesImpl extends JdbcServicesSupport 
{
	//�û�������ҳʱ,�鿴��ǰ�Ƿ��п�Ѻע�ı���
	public List<Map<String, Object>> query()throws Exception
    {
		StringBuilder whereSql = new StringBuilder();
		StringBuilder sql=new StringBuilder()
  				.append("select d.aad101,d.aad102,d.aad103,c.aac1101,")
  				.append("       c.aac1102,c.aac1103,c.aac1104,e.aac702")
  				.append("  from ac11 c,ad01 d,ac07 e")
  				.append(" where d.aac1101=c.aac1101 and e.aac701=c.aac701 ")
  				.append("   and now()>d.aad104 and now()<d.aad105 and c.aac1105=0")
  				;
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		whereSql.append("and d.aac1101=c.aac1101 and e.aac701=c.aac701 and now()>d.aad104 and now()<d.aad105");
		map1.put("floor", String.valueOf(countFloor(" ac11 c,ad01 d,ac07 e ",whereSql.toString(),null)));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		
		sql.append(" limit ?,10 ");
		for(Map<String, Object> list:this.queryForList(sql.toString(),(nowFloor-1)*10))
		{
			rows.add(list);
		}
		return rows;
    }
	
	private boolean isEnough(Object aab101) throws Exception
	{
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double aab106=ab01.getMoney(aab101);
		String count=this.get("count").toString();
		int aad202=0;
		int aad203=0;
		
		if(this.get("aad202"+count)!=null)
    	{
    		aad202=Integer.parseInt(this.get("aad202"+count).toString());
    	}
    	if(this.get("aad203"+count)!=null)
    	{
    		aad203=Integer.parseInt(this.get("aad203"+count).toString());
    	}
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
    	int aad202=0;
    	int aad203=0;
    	String count=this.get("count").toString();
    	if(this.get("aad202"+count)!=null)
    	{
    		aad202=Integer.parseInt(this.get("aad202"+count).toString());
    	}
    	if(this.get("aad203"+count)!=null)
    	{
    		aad203=Integer.parseInt(this.get("aad203"+count).toString());
    	}
    	if(aad202==0&&aad203==0)
    	{
    		this.setMessage("  ��������һ��Ѻע");
    		return false;
    	}
    	Object args1[]={
    			this.get("aad101"),
    			this.get("aab101"),
    			aad202,
    			aad203
    	};
    	this.apppendSql(sql1.toString(), args1);
    	//�۳��û����
    	int aab106=0-aad202-aad203;
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
    			aad202,
    			aad203,
    			this.get("aad101")
    	};
    	this.apppendSql(sql2.toString(), args2);
    	if(this.executeTransaction())
    	{
    		this.setMessage("Ѻע�ɹ�");
    	    return true;
    	}
    	else 
    	{
    		return false;
		}
    }
    
    //��ѯ�����ܶ�
    private Map<String,Object> queryAllCount(Object aad101)throws Exception
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
    	Map<String, Object> map=this.queryForMap(sql,this.get("aad101"));
    	this.put("aac1101", map.get("aac1101"));
    	this.put("aad102", map.get("aad102"));
    	this.put("aad103", map.get("aad103"));
    	this.put("aad104", map.get("aad104"));
    	this.put("aad105", map.get("aad105"));
    	
    	
    }
    
    //��ѯÿһ��ָ������Ѻע
    private List<Map<String,Object>> queryUserCount(Object aad101)throws Exception
    {		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select aad201,aab101,aad202,aad203")
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

    	Map<String,Object> temp=this.queryForMap(sql,aac1101);

    	Object aad101=temp.get("aad101");
    	
    	//2,��ȡѺע�ܶ�
    	Map<String, Object> map=this.queryAllCount(aad101);
    	double countA=Double.parseDouble(map.get("aad102").toString());
    	double countB=Double.parseDouble(map.get("aad103").toString());
    	
    	//3,���ݾ���ID��ȡѺע�û�
    	//3.1��ȡ�û�Ѻע�б�
    	//list���������û�ID ѺעA������ ѺעB������ �˴���Ҫ������û�׬�Ķ�� ���ҷ���ÿһ��map��
    	List<Map<String, Object>> list=this.queryUserCount(aad101);
    	
    	//3.2���ݱ���ʤ���������û��õ���õĽ��,������map��
    	if(tag)
    	{
    		int tem;
    		for(Map<String, Object> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad202").toString());
    			m.put("aad204", String.valueOf((tem+tem*countB/countA)*0.95));//�����û��Ƿ�Ϊ��Ա�۷���ʱδ��
    		}
    	}
    	else
    	{
    		int tem;
    		for(Map<String, Object> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad203").toString());
    			m.put("aad204", String.valueOf((tem+tem*countB/countA)*0.95));
    			
    		}
    	}
    	
    	StringBuilder sql2=new StringBuilder()
    						.append(" update ad02 ")
    						.append("    set aad204=?")
    						.append("  where aad201=?")
    						;
    	
    	for(Map<String, Object> m:list)
		{
    		Object args[]=
    			{
    				m.get("aad204"),
    				m.get("aad201")
    			};
			this.apppendSql(sql2.toString(),args);
		}
    	
    	//4,���ÿһ��Ѻע,���û����и��½��
    	StringBuilder sql3=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;
    	
    	

    	for(Map<String, Object> m:list)
		{
    		Object args[]=
    			{
    				m.get("aad204"),
    				m.get("aab101")
    			};
			this.apppendSql(sql3.toString(),args);
			Tools.sendMessage("����һ��Ѻע���������,����õĽ����: "+m.get("aad204"),(Object)m.get("aab101"));
		}
    	return this.executeTransaction();
    }
}