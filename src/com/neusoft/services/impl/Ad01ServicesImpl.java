package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ad01ServicesImpl extends JdbcServicesSupport 
{
	//用户进入首页时,查看当前是否有可押注的比赛
	public List<Map<String, String>> query()throws Exception
    {
		System.out.println("跳到了AD01的query");
		StringBuilder sql=new StringBuilder()
  				.append("select d.aad101,d.aad102,d.aad103,c.aac1101,")
  				.append("       c.aac1102,c.aac1103,c.aac1104,e.aac702")
  				.append("  from ac11 c,ad01 d,ac07 e")
  				.append(" where d.aac1101=c.aac1101 and e.aac701=c.aac701 ")
  				.append("   and now()>d.aad104 and now()<d.aad105")
  				;
		return this.queryForList(sql.toString());
    }
	
    //用户单次押注时,插入用户押注表并更新竞猜表
    public boolean insertBetLog()throws Exception
    {
    	//
    	this.put("aab101",1);
    	//插入单次押注信息
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad101,aab101,aad202,aad203")
    			.append("          values(?,?,?,?")
    			;
    	Object args1[]={
    			this.get("aad101"),
    			this.get("aab101"),
    			this.get("aad202"),
    			this.get("aad203")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	//扣除用户金额
    	
    	//更新竞猜总额
    	StringBuilder sql2=new StringBuilder()
    			.append("update ad01 a")
    			.append("   set a.aad102=? and a.aad103=?")
    			.append(" where a.aad101=?")
    			;
    	Object args2[]={
    			this.get("aad102"),
    			this.get("aab103"),
    			this.get("aad101")
    	};
    	this.apppendSql(sql2.toString(), args2);
    	return this.executeTransaction();
    }
    
    //查询竞猜总额
    private Map<String,String> queryAllCount()throws Exception
    {		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select aad102,aad103")
  				.append("  from ad01")
  				.append(" where aad101=?")
  				;
  		return this.queryForMap(sql.toString(), this.get("aad101"));
    }
    
    //查询每一笔指定竞猜押注
    private List<Map<String,String>> queryUserCount()throws Exception
    {		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select aab101,aad202,aad203")
  				.append("  from ad02")
  				.append(" where aad101=?")
  				;
  		return this.queryForList(sql.toString(), this.get("aad101"));
    }

    //更新比赛结果时,并方法押注奖金给用户
    public boolean grantReward()throws Exception
    {
    	//1,更新比赛结果
    	StringBuilder sql1=new StringBuilder()
    			.append("update ac11 a")
    			.append("   set a.aac1105=?")
    			.append(" where a.aac1101=?")
    			;
    	Object args1[]={
    			this.get("aac1105"),
    			this.get("aac1101")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	boolean tag=false;
    	if(Integer.parseInt(this.get("aac1105").toString())==1)
    	{
    		tag=true;
    	}
    	
    	//2,获取押注总额
    	Map<String, String> map=this.queryAllCount();
    	int countA=Integer.parseInt(map.get("aad102"));
    	int countB=Integer.parseInt(map.get("aad103"));
    	
    	//3,根据竞猜ID获取押注用户
    	//3.1获取用户押注列表
    	//list中属性有用户ID 押注A方数量 押注B方数量 此处需要计算出用户赚的额度 并且放入每一个map中
    	List<Map<String, String>> list=this.queryUserCount();
    	
    	//3.2根据比赛胜负来计算用户该单获得的金币,并存入map中
    	if(tag)
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad202"));
    			map.put("aad204", String.valueOf((tem+tem/countA*countB)*0.95));//根据用户是否为会员扣费暂时未做
    		}
    	}
    	else
    	{
    		int tem;
    		for(Map<String, String> m:list)
    		{
    			tem=Integer.parseInt(m.get("aad203"));
    			map.put("aad204", String.valueOf((tem+tem/countA*countB)*0.95));
    		}
    	}
    	
    	//4,针对每一条押注,往用户表中更新金额
    	StringBuilder sql2=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;

    	for(Map<String, String> m:list)
		{
    		Object args[]=
    			{
    				m.get("aad204"),
    				m.get("aab101")
    			};
			this.apppendSql(sql2.toString(),args);
			Tools.sendMessage("您有一笔押注公布结果了,您获得的金额是"+m.get("aad204"),m.get("aab101"));
		}
    	return this.executeTransaction();
    }
}