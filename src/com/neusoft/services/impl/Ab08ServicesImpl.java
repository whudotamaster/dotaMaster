package com.neusoft.services.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.jmx.snmp.tasks.ThreadService;
public class Ab08ServicesImpl extends JdbcServicesSupport 
{
	
	 /**
	   * 文章查询 按条件
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> query()throws Exception
	  {
		int number = 10 ;
	  		//还原页面查询条件
	  		Object aab802=this.get("qaab802");     //姓名  模糊查询
	  		//定义SQL主体
	  		StringBuilder whereSql=new StringBuilder();
	  		StringBuilder sql1=new StringBuilder()
	  				.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
	  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
	  				.append("  		   from ab08 x ,ab01 y                          ")
	  				.append("        where x.aab101=y.aab101 and x.aab804 = 2   ")//804审核已通过为2
	
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList1=new ArrayList<>();
	  		
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab802))
	  		{
	  			whereSql.append("  and aab802 like ? ");
	  			sql1.append("  and aab802 like ? ");
  			    paramList1.add("%"+aab802+"%");	
  		    }  				
	  		sql1.append(" order by aab805 desc ");//按照时间降序排列
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
	  		Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			whereSql.append("and x.aab804 = 2");
			map1.put("floor", String.valueOf(countFloor("ab08 x",whereSql.toString(),number,paramList1.toArray())));
			map1.put("nowFloor", String.valueOf(nowFloor));
			rows.add(map1);
			
			
			sql1.append(" limit ?,? ");
			paramList1.add((nowFloor-1)*number);
			paramList1.add(number);
			for(Map<String, Object> list:this.queryForList(sql1.toString(), paramList1.toArray()))
			{
				rows.add(list);
			}
	  		return rows;
	  		
	  }
	
	//管理员查询待审核文章
	public List<Map<String,Object>> adminQueryArticle()throws Exception
	  {
		int number = 10;
	  		//还原页面查询条件
	  		Object aab802=this.get("qaab802");     //姓名  模糊查询
	  		//定义SQL主体
	  		StringBuilder whereSql=new StringBuilder();
	  		StringBuilder sql1=new StringBuilder()
	  				.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
	  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
	  				.append("  		   from ab08 x ,ab01 y                          ")
	  				.append("        where x.aab101=y.aab101 and x.aab804 = 1   ")//804待审核为2
	
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList1=new ArrayList<>();
	  		
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab802))
	  		{
	  			whereSql.append("  and aab802 like ? ");
	  			sql1.append("  and aab802 like ? ");
			    paramList1.add("%"+aab802+"%");	
		    }  				
	  		sql1.append(" order by aab805 desc ");//按照时间降序排列
	  		
	  		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
	  		Map<String, Object> map1 = new HashMap<String, Object>();
	    	int nowFloor =  1;
			if (isNotNull(this.get("nowFloor"))) 
			{
				nowFloor = Integer.valueOf((String)this.get("nowFloor"));
			}
			whereSql.append("and x.aab804 = 1");
			map1.put("floor", String.valueOf(countFloor("ab08 x",whereSql.toString(),number,paramList1.toArray())));
			map1.put("nowFloor", String.valueOf(nowFloor));
			rows.add(map1);
			
			
			sql1.append(" limit ?,? ");
			paramList1.add((nowFloor-1)*number);
			paramList1.add(number);
			for(Map<String, Object> list:this.queryForList(sql1.toString(), paramList1.toArray()))
			{
				rows.add(list);
			}
	  		return rows;	
	  		
	  }
	
	public Map<String,Object> findById()throws Exception
    {
		Object aab801 =  this.get("aab801");
    	return findById(aab801);
    }
	
	public Map<String,Object> findById(Object aab801)throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append(" select  x.aab801,x.aab101,x.aab802,x.aab803,x.aab804,    ")   
  				.append("	  		  x.aab805,x.aab806 ,y.aab102                      ")     
  				.append("  		   from ab08 x ,ab01 y                          ")
  				.append("        where x.aab101=y.aab101    ")
  				.append("         and aab801= ? ")
    			;
    	//执行查询
    	return this.queryForMap(sql1.toString(), aab801);
    }
	
	/**
	 * 添加文章
	 * @return
	 * @throws Exception
	 */
	private boolean addArticle()throws Exception
    {		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("  insert into ab08 (aab101,aab802,aab803,aab804,  ")
    			.append("                   aab805,aab806)               ")
    			.append("                   values(?,?,?,1,            ")
    			.append("                   CURRENT_TIMESTAMP(),?)     ")                    
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aab101"),
    			this.get("aab802"),
    			this.get("aab803"),
    
    			this.get("aab806"),
    			
    	         };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	/**
	 * 文章单一删除
	 * @return
	 * @throws Exception
	 */
	private boolean deleteByIdArticle()throws Exception
    {
    	String sql="delete from ab08 where aab801=?";
    	return this.executeUpdate(sql, this.get("aab801"))>0;
    }
	
	//文章审核通过和不通过
	private boolean passArticle()throws Exception
	{
		String sql="update ab08 set aab804 = 2 where aab801=?";
		return this.executeUpdate(sql, this.get("aab801"))>0;//2==通过
	}
	
	private boolean unpassArticle()throws Exception
	{
		String sql="update ab08 set aab804 = 3 where aab801=?";
		return this.executeUpdate(sql, this.get("aab801"))>0;//3==不通过 留给后续消息提示用
	}
	
	/**
	 * 文章批量删除
	 * @return
	 * @throws Exception
	 */
	private boolean batchDeleteArticle()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ab08 where aab801=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
}