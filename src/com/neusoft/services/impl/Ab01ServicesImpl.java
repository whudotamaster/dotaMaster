package com.neusoft.services.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;
public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	//ʹ��������ҹ�������ѻ�Ա
	public boolean buyVIP()throws Exception
    {
		//�����Ǯ���㿪ͨ������
		if(this.getMoney(this.get("aab101"))<Integer.parseInt(this.get("month").toString())*1000)
		{	
			this.setMessage("��Ǯ����");
			return false;
		}
		System.out.println("aab109:"+this.get("aab109"));
		//���п�ͨ�����ѻ�Ա����
		StringBuilder sql=new StringBuilder();
		boolean tag=this.isVIP(this.get("aab101"));

		//����ǻ�Ա �����ĵ���ʱ�����������ʱ��
		if(tag)
		{
				sql.append("update ab01 a")
					.append("   set a.aab106=a.aab106-?, a.aab109 = DATE_ADD(a.aab109, INTERVAL ? MONTH)")
					.append(" where a.aab101=?")
					;
    	}
		else//���ǻ�Ա �ڵ�ǰʱ��+���Ĺ���ʱ��
		{
			sql.append("update ab01 a")
			.append("   set a.aab106=a.aab106-?,a.aab109 = DATE_ADD(current_date, INTERVAL ? MONTH)")
			.append(" where a.aab101=?")
			;
		}
		
		Object args[]={
				Integer.parseInt(this.get("month").toString())*1000,//�˴���д�û��۵Ľ����,������ҳ�������û���������*ÿ�½��
				this.get("month"),
				this.get("aab101")
		};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
	
	public boolean updatePic(Object aab101,Object aab105) throws Exception
	{
		String sql="update ab01 set aab105=? where aab101=?";
        Object args[]=
        	{
        		aab105,
        		aab101
        	};
        return this.executeUpdate(sql, args)>0;
	}
	
	//�������� �ж��Ƿ�ΪVIP
	public boolean isVIP(Object aab101)throws Exception
	{
		String sql="select aab109 from ab01 where aab101=? and aab109>current_date";
		Map<String, String> map=this.queryForMap(sql, aab101);
		if(map==null)
			return false;
		else
			return true;
	}
	
    private boolean deleteById()throws Exception
    {
    	String sql="delete from ab01 where aab101=?";
    	return this.executeUpdate(sql, this.get("aab101"))>0;
    }
    
    private boolean modifyEmp()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab102=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab111=?,a.aab112=?,")
    			.append("       a.aab113=?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab102"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113"),
    			this.get("aab101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    //�ṩһ���ӿڱ��ڿ����޸����
    public boolean updateMoney(Object aab106,Object aab101)throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			aab106,
    			aab101
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
    
    public Double getMoney(Object aab101)throws Exception
    {
    	String sql="select aab106 from ab01 where aab101=?";
    	Map<String, String> map=this.queryForMap(sql, aab101);
    	return Double.valueOf(map.get("aab106"));
    }
    
    public List<Map<String,String>> queryBuyOrder()throws Exception
    {
    	String sql="select a.aad401,a.aac601,a.aad402,a.aad403,a.aad404,a.aad405,b.aac602,b.aac605 from ad04 a,ac06 b where a.aac601=b.aac601	 and a.aab101=?";                                                                                                                                                                               
    	return this.queryForList(sql, this.get("aab101"));
    }
    
    public List<Map<String,String>> querySellOrder()throws Exception
    {
    	String sql="select a.aad301,a.aac601,a.aad302,a.aad303,a.aad304,a.aad305,b.aac602,b.aac604 from ad03 a,ac06 b where a.aac601=b.aac601 and a.aab101=?";                                                                                                                                                                                
    	return this.queryForList(sql, this.get("aab101"));
    }
    
    //��¼�жϷ���
    public Map<String, String> loginEmp()throws Exception
    {
    	try
    	{
	    	Object aab103 = this.get("aab103");
	    	Object aab104 = this.get("aab104");
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102")	
	    			.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	List<Object> paramList =new ArrayList<>();
	    	paramList.add(aab103);
	    	paramList.add(aab104);
	    	return this.queryForMap(sql.toString(), paramList.toArray());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    public Map<String, String> loginPerson(Object aab103,Object aab104)throws Exception
    {
    	try
    	{
	    	StringBuilder sql=new StringBuilder()
    				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")	
    				.append("			     a.aab106,a.aab107,a.aab108,a.aab109 ")
    				.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	List<Object> paramList =new ArrayList<>();
	    	paramList.add(aab103);
	    	paramList.add(aab104);
	    	return this.queryForMap(sql.toString(), paramList.toArray());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    //�û�������
    private boolean isExist()throws Exception
    {
    	
    	StringBuilder sql=new StringBuilder()
    			.append(" select a.aab101")
    			.append("   from ab01 a")
    			.append("  where a.aab103=?")
    			;
    	return this.queryForMap(sql.toString(), this.get("aab103"))!=null;
    }
    //�û�ע��
    public int logonPerson()throws Exception
    {
    	try
    	{
	    	if (isExist()==true)
	    	{
	    		return 1000;//�����û���������ע��
	    	}
	    	else
	    	{  
		    	Object aab103 = this.get("aab103");
		    	Object aab104 = this.get("aab104");
		    	//�����û���������ݳ����ж�
		    	if(((String) aab103).length()>15||((String) aab104).length()>15)
		    	{
		    		return 2000;
		    	}
		    	else
		    	{
			    	StringBuilder sql=new StringBuilder()
			    			.append("insert into ab01")
			    			.append("(aab102,aab103,aab104,aab105,aab106,")
			    			.append(" 						aab107,aab108,aab109)")
			    			.append("values (?,?,?,'null.png',0,")
			    			.append("							0,1,current_timestamp())")
			       			;
			    	List<Object> paramList =new ArrayList<>();
			    	paramList.add(aab103);
			    	paramList.add(aab103);
			    	paramList.add(aab104);
			    	this.executeUpdate(sql.toString(), paramList.toArray());
			    	return 0;
			    	//�ɹ�д�����ݿ�
			    }
		    
	    	}
    	}
    	catch(Exception e)
    	{
    		//�������3000
    		e.printStackTrace();
    		return 3000;
    	}   	
    }
    //����û�������Ϣ
    public Map<String,String> queryPersonEmp()throws Exception
    {
    	try
    	{
    		StringBuilder sql = new StringBuilder()
    				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")	
    				.append("						  a.aab106,a.aab107,a.aab108,a.aab109")
    				.append("  from ab01 a")
    				.append(" where a.aab101=?")
    				;
    		return this.queryForMap(sql.toString(), this.get("aab101"));
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    //�û��޸ĸ�����Ϣ
    public boolean personUpdateEmp()throws Exception
    {
    	try
    	{
    		Object aab102=this.get("aab102");
    		Object aab104=this.get("aab104");
    		Object aab105=this.get("aab105");
    		Object aab101=this.get("aab101");
    		System.out.println("102="+aab102);
    		System.out.println("104="+aab104);
    		System.out.println("105="+aab105);
    		System.out.println("101="+aab101);
    		StringBuilder sql = new StringBuilder()
					    		.append("update ab01 ")
					    		.append("   set aab102 = ?,aab104=?,aab105=?")
					    		.append(" where aab101 = ?")
					    		;
    		Object args[]=
    			{
        			aab102,
        			aab104,
        			aab105,
        			aab101
    			};
    		return this.executeUpdate(sql.toString(), args)>0;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }

	/**
	 * �Ӿ���ֵ
	 * 
	 * @return
	 * @throws Exception
	 */
	protected final boolean addExp(Object aab101, String expType) throws Exception 
	{
		String sql = "update ab01 set aab107 = aab107+? where aab101=?";
		int exp = 0;

		switch (expType) {
		case "addComment":
			exp = 10;
			break;
		case "addPost":
			exp = 5;
			break;
		default:
			break;
		}
		Object args[] = { 
							exp, 
							aab101 
						};
		return this.executeUpdate(sql, args) > 0;
	}

	/**
	 * ���Ϳ�Ǯ�ͼ�Ǯ
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean reward() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object paab101 = this.get("paab101");
		if (getMoney(aab101) >=5) 
		{
			System.out.println("���X:" + getMoney(aab101));
			String sql1 = "update ab01 set aab106 = aab106-5 where aab101=?";
			this.apppendSql(sql1, aab101);
			String sql2 = "update ab01 set aab106 = aab106+5 where aab101=?";
			this.apppendSql(sql2, paab101);
			return this.executeTransaction();
		}
		else 
		{
			System.out.println("����X:" + getMoney(aab101));
			return false;
		}
	
	}
 
	/**
	 * ָ�����Ӳ�ѯ�ļ���(���� �ظ� �ղ�״̬)
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> postFindById() throws Exception 
	{
		Ab05ServicesImpl ab05 = new Ab05ServicesImpl();
		return ab05.postFindById(this.get("aab101") , this.get("aab501"));
	}
	
    private boolean addEmp()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab103=Tools.getEmpNumber();
    	//��DTO���Ա�����
    	this.put("aab103", aab103);
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aab102"),
    			aab103,
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean batchDelete()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from ab01 where aab101=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }

    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109 ")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
      
      /**
       * ����������ѯ
       * @return
       * @throws Exception
       */
	public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab102=this.get("qaab102");     //����  ģ����ѯ
	  		Object aab103=this.get("qaab103");     //���
	  		Object aab105=this.get("qaab105");     //�Ա�
	  		Object aab106=this.get("qaab106");     //����
	  		Object baab104=this.get("baab104");    //����B
	  		Object eaab104=this.get("eaab104");    //����E
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" and x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
	  		}
	  		if(this.isNotNull(aab103))
	  		{
	  			sql.append(" and x.aab103=?");
	  			paramList.add(aab103);
	  		}
	  		if(this.isNotNull(aab105))
	  		{
	  			sql.append(" and x.aab105=?");
	  			paramList.add(aab105);
	  		}
	  		if(this.isNotNull(aab106))
	  		{
	  			sql.append(" and x.aab106=?");
	  			paramList.add(aab106);
	  		}
	  		if(this.isNotNull(baab104))
	  		{
	  			sql.append(" and x.aab104>=?");
	  			paramList.add(baab104);
	  		}
	  		if(this.isNotNull(eaab104))
	  		{
	  			sql.append(" and x.aab104<=?");
	  			paramList.add(eaab104);
	  		}
	  		
	  		sql.append(" order by x.aab102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }

}