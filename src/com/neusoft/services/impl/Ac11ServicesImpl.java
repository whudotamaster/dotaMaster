package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac11ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String, String>> query()throws Exception
    {
		StringBuilder sql=new StringBuilder()
  				.append("select a.aac1101,b.aac702,a.aac1102,a.aac1103,a.aac1104")
  				.append("  from ac11 a,ac07 b")
  				.append(" where a.aac1105=0  and a.aac701=b.aac701")
  				;
		return this.queryForList(sql.toString());
    }
	
	public boolean announceResult()throws Exception
	{
		String sql="update ac11 set aac1105=? where aac1101=?";
		Object args[]=
			{
					this.get("aac1105"),
					this.get("aac1101")
			};
		
		this.executeUpdate(sql, args);
		
		Ad01ServicesImpl ad01=new Ad01ServicesImpl();
		return ad01.grantReward(this.get("aac1105"),this.get("aac1101"));
	}

	
	/**
	 * ��ѯ���б�����Ϣ��������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryMatch()throws Exception
    {
		//��ԭҳ���ѯ����
  		Object aac702=this.get("qaac702");     //����  ģ����ѯ
		StringBuilder sql=new StringBuilder()
  				.append("select a.aac1101,b.aac702,a.aac1102,a.aac1103,a.aac1104")
  				.append("  from ac11 a,ac07 b")
  				.append(" where  a.aac701=b.aac701")
  				;
		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aac702))
  		{
  			sql.append(" and aac702 like ?");
  			paramList.add("%"+aac702+"%");
  		}
  				
  		sql.append(" order by aac1102 desc");
  		return this.queryForList(sql.toString(), paramList.toArray());
    }
	
	/**
	   * ������Ϣ������ֲ�ѯ
	 * @return
	 * @throws Exception
	 */
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select x.aac1102,x.aac1103,x.aac1104,x.aac1105,s.fvalue,  ")
	    			.append("	  				       y.aac701,y.aac702               ")
	    			.append("	  						   from ac11 x ,ac07 y, syscode s   ")
	    			.append("	    			       where x.aac1105=s.fcode and s.fname='aac1105'   ")     
	    			.append("	    			       and x.aac701=y.aac701    ")           
	    			.append("	    			       and x.aac1101=?       ")        
	    			;
	    	//ִ�в�ѯ
	    	System.out.println(this.queryForMap(sql.toString(), this.get("aac1101")));
	    	return this.queryForMap(sql.toString(), this.get("aac1101"));
	    }
	 
	 
	 
	 /**
	  * �޸ı�������
	 * @return
	 * @throws Exception
	 */
	private boolean modifyMatch()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac11 set aac1102=?,aac1103=?,aac1104=?,aac1105=?  ")
	    			.append("                  where aac1101=?                       ")
	    			;
	    	Object args[]={
	    			this.get("aac1102"),
	    			this.get("aac1103"),
	    			this.get("aac1104"),
	    			this.get("aac1105"),
	    			this.get("aac1101")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	 
	/**
	 * ��ӱ�����Ϣ��ͬʱ������Ӧ��һ����ʼ����Ѻע��Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean addMatch()throws Exception
    {		
    	//1.��дSQL���	
		String sql2="select aac701 from ac07 where aac702=?";
		Object aac701=this.queryForMap(sql2, this.get("aac702")).get("aac701");
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac11 (aac1102,aac1103,aac1104,aac1105,aac701)  ")
    			.append("    			                   values(?,?,?,?,? )  ")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac1102"),
    			this.get("aac1103"),
    			this.get("aac1104"),
    			0,
    			aac701
    	         };
    	int aac1101=Tools.getSequence("aac1101");
    	StringBuilder sql3=new StringBuilder()
    			.append(" insert into ad01 (aac1101,aad102,aad103,aad104,aad105)        ")
    			.append("            values (?,0,0, date_sub(now(), interval 48 hour),  ")
    			.append("                   DATE_ADD(NOW(), INTERVAL 1 Hour))          ")
    			;
    	int n1=this.executeUpdate(sql.toString(), args);
    	int n2=this.executeUpdate(sql3.toString(), aac1101);
    	System.out.println("���뾺�³ɹ�");
        return n1+n2>n1;	
    }
}
