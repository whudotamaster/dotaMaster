package com.neusoft.services.impl;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;
public class Ac06ServicesImpl extends JdbcServicesSupport 
{
	//�Ƿ��ܹ�������Ʒ���ж�
	private boolean allowPurchase(Object aac601)throws Exception
	{
		//1,������ƷID��ѯ��Ʒ������Ϣ
		Map<String, String> acc=this.findAccessories(aac601);
		
		//û�п�湺��ʧ��
		if(Integer.parseInt(acc.get("aac606"))==0)
		{
			this.setMessage("��Ʒ��治��");
			return false;
		}
		
		//2,�����û�ID ��ѯ�û����
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		
		//�û���Ҳ���,����ʧ��
		if(money<Double.parseDouble(acc.get("aac605")))
		{
			this.setMessage("�û�����");
			return false;
		}
		return true;
	}
	
	
	//Ϊ��������͵�������׼�����޸����ݵ��������,ע---δִ������
	private void buyAccessories(Object aac601)throws Exception
    {
			
		Map<String, String> acc=this.findAccessories(aac601);
		
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
		this.apppendSql(sql2, aac601);
		
		//5,����������б�
		StringBuilder sql3=new StringBuilder()
    			.append("insert into ad04(aac601,aab101,aad402,aad403,aad404,aad405) ")
    			.append("          values(?,?,?,?,?,current_timeStamp)")
    			;
		Object args3[]=
			{
				aac601,
				this.get("aab101"),
				this.get("aad402"),
				0,//���״̬Ĭ�ϸ�ֵΪ0
				this.get("aad404")				
			};
		this.apppendSql(sql3.toString(),args3);
    }
	
	//������ҵ��ι�����Ʒ����
	public boolean buyAccessories()throws Exception
    {
		//���ж��ܲ�����
		if(allowPurchase(this.get("aac601")))
		{
			//���뵥�ι����������
			this.buyAccessories(this.get("aac601"));
			//ִ������
			return this.executeTransaction();
		}
		else//���ܹ���
		{
			return false;
		}
    }
	
	//�����������������Ʒ����
	public boolean buyAccessoriesList()throws Exception
	{
		//��ԭҳ������
    	Object idlist[]=this.getIdList("idlist");
    	//��ѯ��Ʒ����۸�,�Լ��Ƿ��л�
    	String sql="select aac605,aac606 from ac06 where aac601=?";
    	List<Map<String, String>> accList=new ArrayList<>();
    	Map<String, String> map=null;
    	for(Object id:idlist)
		{
			map=this.queryForMap(sql, id);
			accList.add(map);
		}
    	System.out.println(accList);
    	
    	//�ܼ۸�
    	int count=0;
    	for(Map<String,String> m:accList)
    	{
    		count+=Double.parseDouble(m.get("aac605").toString());
    		if(Integer.parseInt(m.get("aac606"))<1)
    		{
    			this.setMessage("��治��");
    			return false;
    		}    	
    	}
    	Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		//�û���Ҳ���,����ʧ��
		if(money<count)
		{
			this.setMessage("�û�����");
			return false;
		}
		//����ÿ�ֲ�ͬ��Ʒ,�����������
		for(Object id:idlist)
		{
			this.buyAccessories(id);
		}
		//ִ������
		return executeTransaction();
	}
	
	//������Ʒ����վ
	public boolean sellAccessories()throws Exception
	{
		String sql="insert into ad03(aac601,aab101,aad302,aad303,aad304,aad305) values(?,?,?,?,?,current_timeStamp)";
		Object args[]=
			{
					this.get("aac601"),
					this.get("aab101"),
					this.get("aad302"),
					0,
					this.get("aad304")
			};
		//��ֹ�û������۳�����Ʒ������վ����
		String sql2="select count(*)num from ad03 where aab101=? and aad303=2";
		int count=Tools.getFailCount(sql2, this.get("aab101"));	
		if(count>10)
			return false;	
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

	  				.append("select x.aac601,x.aac602,x.aac603,x.aac604,x.aac605,x.aac606,x.aac101")
	  				.append("		 from ac06 x ,ac01 y")
	  				.append("        where x.aac101=y.aac101   ")
	  				;  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aac602))
	  		{
	  			sql.append(" and aac602 like ?");
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
	//	System.out.println(this.get("aac601"));
	//	System.out.println(this.get("param"));
    	StringBuilder sql1=new StringBuilder()
    			.append("select x.aac601,x.aac602,x.aac603,x.aac604,x.aac605,x.aac606,y.aac102,x.aac101")
  				.append("		 from ac06 x ,ac01 y")
  				.append("        where x.aac101=y.aac101   ")	
  				.append("         and x.aac601= ? ");
    			;  	
    			String aac601=null;
    			if(this.get("aac601") instanceof java.lang.String[])
    			{
    				String[] array=(String[])this.get("aac601");
    				aac601=array[0];
    			}
    			else
    			{
    				aac601=this.get("aac601").toString();
    			}
    	//ִ�в�ѯ
        return this.queryForMap(sql1.toString(), aac601);
    }
	
	/**
	 * ���һ����Ʒ��Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean addAcc()throws Exception
    {		
    	//1.��дSQL���	
	
		Object aac101=this.findIdByNameAc01();
		System.out.println("aac101:"+aac101);
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac06 (aac602,aac603,aac604,aac605,  ")
    			.append("    			                   aac606,aac101)    ")
    			.append("    			                   values(?,?,?,?,?,? )  ")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac602"),
    			this.get("aac603"),
    			this.get("aac604"),
    			this.get("aac605"),
    			this.get("aac606"),
    			aac101
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	 /**
	  * �޸���Ʒ����
	 * @return
	 * @throws Exception
	 */
	   private boolean modifyAcc()throws Exception
	    {
		
		   // Object aac101=this.findIdByNameAc01();
		   // System.out.println("aac101:"+aac101);
	    	StringBuilder sql=new StringBuilder()
	    			.append("	update ac06 set aac602=?,aac603=?,aac604=?,aac605=?,aac606=?,aac101=?  ")
		            .append("   where aac601=? ")
	    			;
	    	System.out.println(this.get("aac601"));
	    	Object args[]={
	    			this.get("aac602"),
	    			this.get("aac603"),
	    			this.get("aac604"),
	    			this.get("aac605"),
	    			this.get("aac606"),
	    			this.get("aac101"),    	
	    			this.get("aac601")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	   
	   
	   /**
		 * ��Ʒ��������ɾ��
		 * @return
		 * @throws Exception
		 */
		private boolean batchDelAcc()throws Exception
	    {
	    	//1.����SQL���
	    	String sql="delete from ac06 where aac601=?";
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
		private boolean delByIdAcc()throws Exception
	    {
	    	String sql="delete from ac06 where aac601=?";
	    	return this.executeUpdate(sql, this.get("aac601"))>0;
	    }
}