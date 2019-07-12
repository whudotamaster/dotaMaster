package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

import jdk.nashorn.internal.ir.Flags;

public class Ab07ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ����ʱ�ж��û��ղ�״̬
	 * 
	 * @return
	 * @throws Exception
	 */
	public final Boolean queryCollection(Object aab101 , Object aab501) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701")
    			.append("  from ab07 a")
    			.append(" where a.aab101=? and a.aab501=?")
    			;
    	Object args[] = {
    						aab101,
    						aab501
    					};
    	return queryForMap(sql.toString(), args) != null;
	}

	/**
	 * ����ղ�
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean addCollectionById() throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into ab07(aab501,aab101,aab702)")
				.append("    values (?,?,current_timestamp())")
				;
				
		Object args[]={
						this.get("aab501"),
						this.get("aab101")
					  };
		return	this.executeUpdate(sql.toString(), args)>0;
	}

	/**
	 * �h���ղ�
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delCollectionById() throws Exception 
	{
		String sql = "delete from ab07 where aab501=? and aab101=?";
		Object args[]={
						this.get("aab501"),
						this.get("aab101"),
					  };
		return	this.executeUpdate(sql, args)>0;
	}
	
	/**
	 * �����û������ղ�
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryCollectionList() throws Exception
	{
		Object aab101 = this.get("aab101");
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab701,a.aab501,a.aab101,a.aab702,b.aab502,c.aab102")
    			.append("  from ab07 a,ab05 b,ab01 c")
    			.append(" where a.aab101=? and a.aab501=b.aab501 and b.aab101=c.aab101")
    			.append(" order by a.aab702 desc")
    			;
    	System.out.println("aab101:" + this.get("aab101"));
    	return queryForList(sql.toString(), aab101);
	}

	/**
	 * ����ɾ���ղ�
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delCollection() throws Exception 
	{
		// 1.����SQL���
		String sql = "delete from ab07 where aab701=?";
		// 2.��ȡҳ��idlist����
		String idlist[] = this.getIdList("idlist");
		// 3.ִ��
		return this.batchUpdate(sql, idlist);
	}
	
	/**
	 * �����û���ʷ����
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryHistory() throws Exception 
	{
		// 1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append(" select a.aab501,a.aab502,a.aab504,a.aab505 ")
				.append("   from ab05 a ")
				.append("  where a.aab101=? ")
				.append("  order by a.aab504 desc ")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	/**
	 * ���������h��
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean delPost() throws Exception 
	{
		String idlist[] = this.getIdList("idlist");
		String sql1 = "delete from ab06 where aab501=?";
		String sql2 = "delete from ab07 where aab501=?";
		String sql3 = "delete from ab05 where aab501=?";
		for (String aab501:idlist) 
		{
			this.apppendSql(sql1, aab501);
			this.apppendSql(sql2, aab501);
			this.apppendSql(sql3, aab501);
		}
		return executeTransaction();
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
}
