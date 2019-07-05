package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport 
{
	
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
    
    
    
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
    
    
      
    
	  /**
	   * Ӣ����Ϣ������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryHero()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object aab102=this.get("qaac102");     //����  ģ����ѯ
	  	
	  		
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
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" where x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
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
	
	 public Map<String,String> findByIdHero()throws Exception
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
}