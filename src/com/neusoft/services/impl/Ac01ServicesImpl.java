package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

/**
 * @author Recardox
 *
 */
public class Ac01ServicesImpl extends JdbcServicesSupport 
{
	
                           
	  /**
	   * Ӣ����Ϣ������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aac102=this.get("qaac102");     //����  ģ����ѯ
	  	
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac101,aac102,aac103,aac104,aac105,")
	  				.append("       aac106,aac107,aac108,aac109,aac110,")
	  				.append("		aac111,aac112")
	  				.append("		 from ac01 ")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aac102))
	  		{
	  			sql.append(" where aac102 like ?");
	  			paramList.add("%"+aac102+"%");
	  		}
	  				
	  		sql.append(" order by aac102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	
	
	/**
	 * ���һ��Ӣ��
	 * @return
	 * @throws Exception
	 */
	private boolean addHero()throws Exception
    {		
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac01 (aac102,aac103,aac104,aac105,")
    			.append("                   aac106,aac107,aac108,aac109,aac110,")
    			.append("				    aac111) ")
    			.append("                   values(?,?,?,?, ")
    			.append("				           ?,?,?,?,?, ")
    			.append("						   ?) ")	            
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac102"),
    			this.get("aac103"),
    			this.get("aac104"),
    			this.get("aac105"),
    			this.get("aac106"),
    			this.get("aac107"),
    			this.get("aac108"),
    			this.get("aac109"),
    			this.get("aac110"),
    			this.get("aac111")
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	/**
	 * Ӣ����������ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteHero()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from ac01 where aac101=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }
	
	
	  /**
	   * Ӣ����Ϣ������ֲ�ѯ
	 * @return
	 * @throws Exception
	 */
	 public Map<String,Object> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select aac102,aac103,aac104,aac105,")
	  				.append("       aac106,aac107,aac108,aac109,aac110,")
	  				.append("		aac111,aac112")
	  				.append("		 from ac01 ")
	    			.append(" where aac101=?")
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aac101"));
	    }
	 
	 //����Ӣ�۵��츳
	 public List<Map<String, Object>> FBIforMore()throws Exception
	 {
		 StringBuilder sql=new StringBuilder()
				 .append("select x.aac101,x.aac102,x.aac112,y.aac201,y.aac202,y.aac203  ")
				 .append("	  	 from ac01 x, ac02 y                          ")
				 .append("	     where x.aac101=y.aac101                     ")
				 .append("         and x.aac101=?                             ")
				 .append("         ORDER BY y.aac202                            ")
				 ;
	
		 return this.queryForList(sql.toString(), this.get("aac101"));
	 }
	 //����Ӣ�۵ļ���
	 public List<Map<String, Object>> findByIdSkill()throws Exception
	 {
		 String sql ="select aac302,aac303,aac304,aac305,aac306 from ac03 where aac101=? ";
		 return this.queryForList(sql, this.get("aac101"));
	 }
	 
	 /**
	  * �޸�Ӣ������
	 * @return
	 * @throws Exception
	 */
	private boolean modifyHero()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac01 set  aac102=?,aac103=?,aac104=?,aac105=?, ")
	    			.append("                  aac106=?,aac107=?,aac108=?,aac109=?,aac110=?, ")
	    			.append("			       aac111=?,aac112=? ")
	    			.append("                  where aac101=? ")
	    			;
	    	Object args[]={
	    			this.get("aac102"),
	    			this.get("aac103"),
	    			this.get("aac104"),
	    			this.get("aac105"),
	    			this.get("aac106"),
	    			this.get("aac107"),
	    			this.get("aac108"),
	    			this.get("aac109"),
	    			this.get("aac110"),
	    			this.get("aac111"),
	    			this.get("aac112"),	    	
	    			this.get("aac101")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	
	/**
	 * ��һʵ��ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean deleteByIdHero()throws Exception
    {
    	String sql="delete from ac01 where aac101=?";
    	return this.executeUpdate(sql, this.get("aac101"))>0;
    }
}