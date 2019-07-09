package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.Select;

public class Ac06ServicesImpl extends JdbcServicesSupport 
{
	
	//使用虚拟货币购买饰品
	public boolean buyAccessories()throws Exception
    {
		//
		//this.put("aac601", 1);
		//this.put("aab101", 1);
		//1,根据饰品ID查询饰品其他信息
		Map<String, String> acc=this.findAccessories(this.get("aac601"));
		
		//没有库存购买失败
		if(Integer.parseInt(acc.get("aac606"))==0)
		{
			return false;
		}
		
		//2,根据用户ID 查询用户余额
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Double money=ab01.getMoney(this.get("aab101"));
		
		//用户金币不足,购买失败
		if(money<Double.parseDouble(acc.get("aac605")))
		{
			return false;
		}
		
		//3,减少用户余额,由于是事务性操作 只能重新编写sql语句
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
		
		//4,更新饰品库存
		String sql2="update ac06 set aac606=aac606-1 where aac601=?";
		this.apppendSql(sql2, this.get("aac601"));
		
		//5,插入待发货列表
		StringBuilder sql3=new StringBuilder()
    			.append("insert into ad04(aac601,aab101,aad402,aad403,aad404) ")
    			.append("          values(?,?,?,?,?)")
    			;
		Object args3[]=
			{
				this.get("aac601"),
				this.get("aab101"),
				this.get("aad402"),
				0,//完成状态默认赋值为0
				this.get("aad404")				
			};
		this.apppendSql(sql3.toString(),args3);
		
		return this.executeTransaction();
    }
	
	//出售饰品给网站
	public boolean sellAccessories()throws Exception
	{
		String sql="insert into ad03(aac601,aab101,aad302,aad303,aad304) values(?,?,?,?,?)";
		Object args[]=
			{
					this.get("aac601"),
					this.get("aab101"),
					this.get("aad302"),
					0,
					this.get("aad304")
			};
		
		return this.executeUpdate(sql, args)>0;
		
	}
	
	//根据饰品ID查找其他信息
	public Map<String, String> findAccessories(Object aac601) throws Exception
	{
		//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac601,a.aac602,a.aac603,a.aac604,a.aac605,a.aac606,")
    			.append("       a.aac101")
    			.append("  from ac06 a")
    			.append(" where a.aac601=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), aac601);
	}
}