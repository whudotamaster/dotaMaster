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
	  				.append( " where true ")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		
	  		if(this.isNotNull(aab502))
	  		{
	  			sql.append(" and b.aab502 like ?");
	  			paramList.add("%"+aab502+"%");
	  		}
	  		if(aab506.equals("1"))
	  		{
	  			sql.append(" and b.aab506=?");
	  			paramList.add(aab506);
	  		}
	  		sql.append(" order by b.aab504 ");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	    private boolean modifyGoodPost()throws Exception
	    {
	    	//1.����SQL���
	    	String sql="update ab05 a set aab506='1' where a.aab501=?";
	    	//2.��ȡҳ��idlist����
	    	String idlist[]=this.getIdList("idlist");
	    	//3.ִ��
	    	return this.batchUpdate(sql, idlist);	
	    }
	  
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
}
