package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ab05ServicesImpl extends JdbcServicesSupport 
{

	  /**
     * ��̳��ҳ���Ӳ���������ѯ
     * @return
     * @throws Exception
     */
	  public List<Map<String,String>> queryPost()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab502=this.get("aab502");     //����  ģ����ѯ
	  		Object aab506=this.get("aab506");     //��ͨ���򾫻���

	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append(" select b.aab501,b.aab101,a.aab102,a.aab105,b.aab502,b.aab504,b.aab505,")
	  				.append("	     b.aab506")
	  				.append("   from ab05 b,ab01 a")
	  				.append( "  where b.aab101=a.aab101  ")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		
	  		if(this.isNotNull(aab502))
	  		{
	  			sql.append(" and b.aab502 like ?");
	  			paramList.add("%"+aab502+"%");
	  		}
	  		if(this.isNotNull(aab506) && aab506.equals("1"))
	  		{
	  			sql.append(" and b.aab506=?");
	  			paramList.add(aab506);
	  		}
	  		sql.append(" order by b.aab504 DESC ");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  	/**
	     * ��̳��ҳ���ӼӾ�
	     * @return
	     * @throws Exception
	     */
	    private boolean modifyGoodPost()throws Exception
	    {
	    	//1.����SQL���
	    	String sql="update ab05 a set aab506='1' where a.aab501=?";
	    	//2.��ȡҳ��idlist����
	    	String idlist[]=this.getIdList("idlist");
	    	//3.ִ��
	    	return this.batchUpdate(sql, idlist);	
	    }
	  
	    /**
	     * ��̳��ҳ���ӄh��
	     * @return
	     * @throws Exception
	     */
	    private boolean delPost()throws Exception
	    {
	    	String sql1="delete from ab06 where aab501=?";
	    	this.executeUpdate(sql1, this.get("aab501"));
    		String sql2="delete from ab05 where aab501=?";
	    	return this.executeUpdate(sql2, this.get("aab501"))>0;
	    }
	    
	    /**
	     * ����
	     * @return
	     * @throws Exception
	     */
	    private boolean addPost()throws Exception
	    {
	    	Object aab101=this.get("aab101");
	    	Object aab502=this.get("apaab502");
	    	Object aab503=this.get("apaab503");
	    	if (this.isNotNull(aab101)&&this.isNotNull(aab502)&&this.isNotNull(aab503)&&!aab503.equals("<p><br></p>")) {
	    		StringBuilder sql=new StringBuilder()
		    			.append(" insert into ab05(aab101,aab502,aab503,aab504,aab505,")
		    			.append("                  aab506)")
		    			.append("           values(?,?,?, current_timestamp(),'0',")
		    			.append("                  '0')")
		    			;
	    		Object args[]=
	    			{
	    				aab101,
	    				aab502,
	    				aab503
	    			}
	    			;
	    		
	    		Boolean tag = this.executeUpdate(sql.toString(), args)>0;
	    		addExp(aab101,"addPost");
	  			return  tag;
	  			
			} 
	    	return false;
	    }

	    /**
	     * ָ�����Ӳ�ѯ
	     * @return
	     * @throws Exception
	     */
		  public List<Map<String,String>> postFindById()throws Exception
		  {
		  		//��ԭҳ���ѯ����
		  		Object aab501=this.get("aab501");     //����ID
		  		//����SQL����
		  		StringBuilder sql=new StringBuilder()
		  				.append(" select a.aab102,a.aab105,b.aab502,b.aab503,b.aab504")
		  				.append("   from ab01 a,ab05 b")
		  				.append("  where b.aab501=? and a.aab101=b.aab101")
		  				.append("  order by b.aab504")
		  				;
		  		//�����б�
		  		List<Object> paramList=new ArrayList<>();
		  			paramList.add(aab501);
		  		return this.queryForList(sql.toString(), paramList.toArray());
		  }
		  
		  /**
		     * ָ�����ӵĻظ���ѯ
		     * @return
		     * @throws Exception
		     */
			  public List<Map<String,String>> commentFindById()throws Exception
			  {
			  		//��ԭҳ���ѯ����
			  		Object aab501=this.get("aab501");     //����ID
			  		//����SQL����
			  		StringBuilder sql=new StringBuilder()
			  				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604 ")
			  				.append("   from ab01 a,ab06 b ")
			  				.append("  where aab501=? and a.aab101=b.aab101 ")
			  				.append("  order by b.aab604")
			  				;
			  		//�����б�
			  		List<Object> paramList=new ArrayList<>();
			  			paramList.add(aab501);
			  		return this.queryForList(sql.toString(), paramList.toArray());
			  }
		  
		    /**
		     * �ظ�
		     * @return
		     * @throws Exception
		     */
		    private boolean addComment()throws Exception
		    {
		    	Object aab101=this.get("aab101");
		    	Object aab501=this.get("aab501");
		    	Object aab603=this.get("acaab603");
		    	if (this.isNotNull(aab101)&&this.isNotNull(aab501)&&this.isNotNull(aab603)) 
		    	{
		    		String sql1= " select aab505 from ab05 where aab501=?";
		    		List<Map<String,String>> aab505_1 = this.queryForList(sql1, aab501);
		    		String floor = null;
		    		for(Map<String,String> aObject:aab505_1)
		    		{
		    			floor = aObject.get("aab505");
		    		}
		    		int aab505 = Integer.parseInt(floor)+1;
		    		StringBuilder sql2=new StringBuilder()
		    				.append(" insert into ab06(aab101,aab501,aab602,aab603,aab604)")
		    				.append("    values (?,?,?,?,CURRENT_TIMESTAMP())")
			    			;
		    		Object args1[]=
		    			{
		    				aab101,
		    				aab501,
		    				aab505,
		    				aab603
		    			};
		    		Boolean tag = this.executeUpdate(sql2.toString(), args1)>0;
		    		StringBuilder sql3 = new StringBuilder()
		    				.append(" update ab05 ")
		    				.append("    set aab505 = ? ,aab504 = CURRENT_TIMESTAMP() ")
		    				.append("  where aab501= ? ")
		    				;
		    		Object args2[]=
		    			{
		    				aab505,
		    				aab501
		    			};
		    		tag = this.executeUpdate(sql3.toString(), args2)>0 && tag;
		    		addExp(aab101,"addComment");
		    		return tag ;
				} 
		    	return false;
		    }
			  
		    /**
		     * �Ӿ���ֵ
		     * @return
		     * @throws Exception
		     */
		    private boolean addExp(Object aab101 , String expType)throws Exception
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
		    	return this.executeUpdate(sql, args)>0;
		    } 
}
