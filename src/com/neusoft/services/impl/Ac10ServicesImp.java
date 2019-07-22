package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac10ServicesImp extends JdbcServicesSupport 
{

	 /**
	   * ѡ����Ϣ������ģ����ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
		int number = 10;
	  		//��ԭҳ���ѯ����
	  		Object aac1002=this.get("qaac1002");     //����  ģ����ѯ
	  		
	  		//����SQL����
	  		StringBuilder whereSql=new StringBuilder();
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac1001,aac1002,aac1003,aac1004,aac1005,")
	  				.append("		aac901")
	  				.append("		 from ac10 ")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aac1002))
	  		{
	  			whereSql.append(" and aac1002 like ?");
	  			sql.append(" where aac1002 like ?");
	  			paramList.add("%"+aac1002+"%");
	  		}
	  				
	  		sql.append(" order by aac1002");
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			map1.put("floor", String.valueOf(countFloor(" ac10 ",whereSql.toString(),number,paramList.toArray())));
			map1.put("nowFloor", String.valueOf(nowFloor));
			rows.add(map1);
			
			
			sql.append(" limit ?,? ");
			paramList.add((nowFloor-1)*number);
			paramList.add(number);
			for(Map<String, Object> list:this.queryForList(sql.toString(), paramList.toArray()))
			{
				rows.add(list);
			}
			return rows;
	  }
	
	
	/**
	   * ѡ����Ϣ��һʵ����ѯ
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> findById()throws Exception
    {
  	    //1.��дSQL���
  	    StringBuilder sql1=new StringBuilder()
  			    .append("select x.aac1001,x.aac1002,x.aac1003,x.aac1004,x.aac1005,y.aac902,x.aac901")
				.append("		 from ac10 x ,ac09 y")
				.append("        where x.aac901=y.aac901   ")	
				.append("        and x.aac1001= ? ");
  			;  	
  	    //ִ�в�ѯ
       return this.queryForMap(sql1.toString(), this.get("aac1001"));
    }
	
	
	/**
	 * ���һ��ѡ����Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean addPlayer()throws Exception
    {		
    	//1.��дSQL���
		String sql2="select aac901 from ac09 where aac902=?";
		Object aac901=this.queryForMap(sql2, this.get("aac902")).get("aac901");
    	StringBuilder sql=new StringBuilder()
    			.append(" insert into ac10 (aac1002,aac1003,aac1004,aac1005,")
    			.append("				    aac901) ")
    			.append("                   values(?,?,?,?, ")
    			.append("						   ?) ")	            
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac1002"),
    			this.get("aac1003"),
    			this.get("aac1004"),
    			this.get("aac1005"),
    			aac901
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	/**
	 * ��һʵ��ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean delByIdPlayer()throws Exception
    {
    	String sql="delete from ac10 where aac1001=?";
    	return this.executeUpdate(sql, this.get("aac1001"))>0;
    }
	
	/**
	 * ѡ����������ɾ��
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelPlayer()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from ac10 where aac1001=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }
	
	
	
	/**
	  * �޸�ѡ����Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean modifyPlayer()throws Exception
	{
		    String sql2="select aac901 from ac09 where aac902=?";
		    Object aac901=this.queryForMap(sql2, this.get("aac902")).get("aac901");
	    	StringBuilder sql=new StringBuilder()
	    			.append(" update ac10 set  aac1002=?,aac1003=?,aac1004=?,aac1005=?, ")
	    			.append("			       aac901=? ")
	    			.append("                  where aac1001=? ")
	    			;
	    	Object args[]={
	    			this.get("aac1002"),
	    			this.get("aac1003"),
	    			this.get("aac1004"),
	    			this.get("aac1005"),
	    			aac901,
	    			this.get("aac1001")
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
}
