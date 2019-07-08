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
	  		sql.append(" order by b.aab504 ");
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
	    	if(this.executeUpdate(sql1, this.get("aab501"))>0)
	    	{
	    		String sql2="delete from ab05 where aab501=?";
		    	return this.executeUpdate(sql2, this.get("aab501"))>0;
	    	}
	    	return false;
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
	    	if (this.isNotNull(aab101)&&this.isNotNull(aab502)&&this.isNotNull(aab503)) {
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
	  			return this.executeUpdate(sql.toString(), args)>0;
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
		  				.append("  where a.aab101=b.aab101 and b.aab501=?")
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
			  				.append(" select a.aab102,a.aab105,b.aab602,b.aab603,b.aab604")
			  				.append("   from ab01 a,ab06 b")
			  				.append("  where a.aab101=b.aab101 and b.aab501=?")
			  				.append("  order by b.aab602 ")
			  				;
			  		//�����б�
			  		List<Object> paramList=new ArrayList<>();
			  			paramList.add(aab501);
			  		return this.queryForList(sql.toString(), paramList.toArray());
			  }
}
