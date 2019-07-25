package com.neusoft.services.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.sun.corba.se.impl.orbutil.ObjectWriter;
import com.sun.org.apache.bcel.internal.generic.Select;
public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	//使用虚拟货币购买或续费会员
	public boolean buyVIP()throws Exception
    {
		if(this.get("month")==null)
		{
			this.setMessage("请输入开通会员的月数");
			return false;
		}
		
		//如果金钱不足开通的月数
		if(this.getMoney(this.get("aab101"))<Integer.parseInt(this.get("month").toString())*1000)
		{	
			this.setMessage("金钱不足");
			return false;
		}
		System.out.println("aab109:"+this.get("aab109"));
		//进行开通或续费会员操作
		StringBuilder sql=new StringBuilder();
		boolean tag=this.isVIP(this.get("aab101"));

		//如果是会员 在他的到期时间后增加续费时长
		if(tag)
		{
				sql.append("update ab01 a")
					.append("   set a.aab106=a.aab106-?, a.aab109 = DATE_ADD(a.aab109, INTERVAL ? MONTH)")
					.append(" where a.aab101=?")
					;
    	}
		else//不是会员 在当前时间+他的购买时长
		{
			sql.append("update ab01 a")
			.append("   set a.aab106=a.aab106-?,a.aab109 = DATE_ADD(current_date, INTERVAL ? MONTH)")
			.append(" where a.aab101=?")
			;
		}
		
		Object args[]={
				Integer.parseInt(this.get("month").toString())*1000,//此处填写用户扣的金额数,根据网页传来的用户购买月数*每月金额
				this.get("month"),
				this.get("aab101")
		};
		if (this.executeUpdate(sql.toString(), args)>0) 
		{
			String sql2="select aab109 from ab01 where aab101=?";
			Map<String, Object> map=this.queryForMap(sql2, this.get("aab101"));
			this.setMessage("开通成功，VIP时间到 ："+map.get("aab109"));
			return true;
		}
		
    	return false;
    }
	
		/**
		 * 
		 * 使用人民币购买或续费会员
		 * @param aab101
		 * @param total_amount
		 * @return
		 * @throws Exception
		 */
		public boolean buyVIP(String aab101,String total_amount)throws Exception
	    {
		
			StringBuilder sql=new StringBuilder();
			boolean tag=this.isVIP(aab101);

			//如果是会员 在他的到期时间后增加续费时长
			if(tag)
			{
					sql.append("update ab01 a")
						.append("   set  a.aab109 = DATE_ADD(a.aab109, INTERVAL ? MONTH)")
						.append(" where a.aab101=?")
						;
	    	}
			else//不是会员 在当前时间+他的购买时长
			{
				sql.append("update ab01 a")
				.append("   set a.aab109 = DATE_ADD(current_date, INTERVAL ? MONTH)")
				.append(" where a.aab101=?")
				;
			}
			
			Object args[]={
					Double.parseDouble(total_amount)/10,//根据充值金额判断会员月数
					aab101
			};
			System.out.println("会员购买时长："+	Double.parseDouble(total_amount)/10+"个月");
	    	return this.executeUpdate(sql.toString(), args)>0;
	    }
		
	/**
	 * 购买虚拟货币
	 * @param aab101
	 * @param total_amount
	 * @return
	 * @throws Exception
	 */
	public boolean buyCurrency(String aab101,String total_amount)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update ab01 a")
				.append("   set  a.aab106 = a.aab106+?")
				.append(" where a.aab101=?")
				;

		Object args[]={
				Double.parseDouble(total_amount)*100,//根据充值金额判断虚拟货币数
				aab101
		};
		System.out.println("购买虚拟货币数："+	Double.parseDouble(total_amount)*100);
		return this.executeUpdate(sql.toString(), args)>0;
	}
	//更新头像
	public boolean updatePic(Object aab101,Object aab105) throws Exception
	{
		String sql="update ab01 set aab105=? where aab101=?";
        Object args[]=
        	{
        		aab105,
        		aab101
        	};
        return this.executeUpdate(sql, args)>0;
	}
	
	//辅助方法 判断是否为VIP
	public boolean isVIP(Object aab101)throws Exception
	{
		String sql="select aab109 from ab01 where aab101=? and aab109>current_date";
		Map<String, Object> map=this.queryForMap(sql, aab101);
		if(map==null)
			return false;
		else
			return true;
	}
	
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
    
    //提供一个接口便于快速修改余额
    public boolean updateMoney(Object aab106,Object aab101)throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab106=a.aab106+?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			aab106,
    			aab101
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
    
    public Double getMoney(Object aab101)throws Exception
    {
    	String sql="select aab106 from ab01 where aab101=?";
    	Map<String, Object> map=this.queryForMap(sql, aab101);
    	return Double.valueOf(map.get("aab106").toString());
    }
    
    public List<Map<String,Object>> queryBuyOrder()throws Exception
    {                          
    	int number = 15 ;
    	StringBuilder whereSql=new StringBuilder();
    	StringBuilder sql=new StringBuilder()
    					  .append("select a.aad401,a.aac601,a.aad402,a.aad403,a.aad404,")
    					  .append("       a.aad405,b.aac602,b.aac605,c.fvalue")
    					  .append("  from ad04 a,ac06 b,syscode c ")
    					  .append(" where a.aac601=b.aac601 and c.fname='aad403'")
    					  .append("   and c.fcode=a.aad403 and a.aab101=?")
    					  .append(" order by a.aad405 desc");
    	whereSql.append("  and a.aac601=b.aac601 and c.fname='aad403'")
         	    .append("   and c.fcode=a.aad403 and a.aab101=?");
    	
    	List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
    	int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		map1.put("floor", String.valueOf(countFloor("ad04 a,ac06 b,syscode c",whereSql.toString(),number,this.get("aab101"))));
		map1.put("nowFloor", String.valueOf(nowFloor));
		rows.add(map1);
		
		
		sql.append(" limit ?,? ");
		Object args[]={
				this.get("aab101"),
				(nowFloor-1)*number,
				number
				};
    	
		for(Map<String, Object> list:this.queryForList(sql.toString(), args))
		{
			rows.add(list);
		}
		return rows;
    }
    
    public List<Map<String,Object>> querySellOrder()throws Exception
    {                 
    	int number = 15 ; 
    	StringBuilder whereSql=new StringBuilder();
    	StringBuilder sql=new StringBuilder()
				  .append("select a.aad301,a.aac601,a.aad302,a.aad303,a.aad304,")
				  .append("       a.aad305,b.aac602,b.aac604,c.fvalue")
				  .append("  from ad03 a,ac06 b,syscode c ")
				  .append(" where a.aac601=b.aac601 and c.fname='aad303'")
				  .append("   and c.fcode=a.aad303 and a.aab101=?")
				  .append(" order by a.aad305 desc");
    	whereSql.append("   and a.aac601=b.aac601 and c.fname='aad303'")
		        .append("   and c.fcode=a.aad303 and a.aab101=?");
    	

    	List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
    		Map<String, Object> map1 = new HashMap<String, Object>();
        	int nowFloor =  1;
    		if (isNotNull(this.get("nowFloor")))
    		{
    			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
    		}
    		map1.put("floor", String.valueOf(countFloor("ad03 a,ac06 b,syscode c",whereSql.toString(),number,this.get("aab101"))));
    		map1.put("nowFloor", String.valueOf(nowFloor));
    		rows.add(map1);
    		
    		
    		sql.append(" limit ?,? ");
    			Object args[]={
    								this.get("aab101"),
    								(nowFloor-1)*number,
    								number
    								};
    		for(Map<String, Object> list:this.queryForList(sql.toString(), args))
    		{
    			rows.add(list);
    		}
    		return rows;
    }
    
    //登录判断方法
    public Map<String, Object> loginEmp()throws Exception
    {
    	try
    	{
	    	Object aab103 = this.get("aab103");
	    	Object aab104 = Tools.getMd5(this.get("aab104"));

	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102")	
	    			.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	List<Object> paramList =new ArrayList<>();
	    	paramList.add(aab103);
	    	paramList.add(aab104);
	    	return this.queryForMap(sql.toString(), paramList.toArray());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    public Map<String, Object> loginPerson(Object aab103,Object aab104)throws Exception
    {
    	try
    	{
	    	Object x104 = Tools.getMd5(aab104);

	    	StringBuilder sql=new StringBuilder()
    				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")	
    				.append("			     a.aab106,a.aab107,a.aab108,a.aab109 ")
    				.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	List<Object> paramList =new ArrayList<>();
	    	paramList.add(aab103);
	    	paramList.add(x104);
	    	return this.queryForMap(sql.toString(), paramList.toArray());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    //用户名查重
    private boolean isExist()throws Exception
    {
    	
    	StringBuilder sql=new StringBuilder()
    			.append(" select a.aab101")
    			.append("   from ab01 a")
    			.append("  where a.aab103=?")
    			;
    	return this.queryForMap(sql.toString(), this.get("aab103"))!=null;
    }
    //用户注册
    public boolean insert()throws Exception
    {
    	try
    	{
	    	if (isExist()==true)
	    	{
	    		this.setMessage("注册失败，用户名重复！");
	    		return false;
	    	}
	    	else
	    	{  
		    	Object aab103 = this.get("aab103");
			    Object aab104 = Tools.getMd5(this.get("aab104"));
		    	//进行用户输入的数据长度判断
		    	if(((String) aab103).length()>15)
		    	{
		    		this.setMessage("输入的用户名过长，最多可输入15位");
		    		return false;
		    	}
		    	else
		    	{
			    	StringBuilder sql=new StringBuilder()
			    			.append("insert into ab01")
			    			.append("(aab102,aab103,aab104,aab105,aab106,")
			    			.append(" 						aab107,aab108,aab109)")
			    			.append("values (?,?,?,'默认头像.png',0,")
			    			.append("							0,1,current_timestamp())")
			       			;
			    	List<Object> paramList =new ArrayList<>();
			    	paramList.add(aab103);
			    	paramList.add(aab103);
			    	paramList.add(aab104);
			    	this.executeUpdate(sql.toString(), paramList.toArray());
			    	Object userId = this.getUserId(aab103);
			    	Tools.setMission(userId);
			    	this.setMessage("注册成功，请登录！");
			    	Tools.sendMessage("欢迎来到DotaMaster综合网站！你可以在本网站进行资讯查询，赛事竞猜，论坛交流，还可以参与互动获得M点，换取精美饰品！", userId);
			    	return true;
			    	//成功写入数据库
			    }
		    
    	}
    	}
    	catch(Exception e)
    	{
    		//报错，输出3000
    		e.printStackTrace();
    		return false;
    	}   	
    }
    //获得用户个人信息
    public Map<String,Object> queryPerson()throws Exception
    {
    	try
    	{
    		StringBuilder sql = new StringBuilder()
    				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")	
    				.append("						  a.aab106,a.aab107,a.aab108,a.aab109")
    				.append("  from ab01 a")
    				.append(" where a.aab101=?")
    				;
    		System.out.println("queryPerson() aab101="+this.get("aab101"));
    		return this.queryForMap(sql.toString(), this.get("aab101"));
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    public Object getUserId(Object userName)throws Exception
    {
    	try
    	{
    		StringBuilder sql = new StringBuilder()
    				.append("select aab101")
    				.append("  from ab01")
    				.append(" where aab103=?")
    				;
    		return this.queryForMap(sql.toString(),userName).get("aab101");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    public Map<String,Object> queryPerson(Object aab101)throws Exception
    {
    	try
    	{
    		StringBuilder sql = new StringBuilder()
    				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")	
    				.append("						  a.aab106,a.aab107,a.aab108,a.aab109")
    				.append("  from ab01 a")
    				.append(" where a.aab101=?")
    				;
    		return this.queryForMap(sql.toString(), aab101);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return null;
    	}
    }
    
    
    //用户修改昵称
    public boolean updateUsername()throws Exception
    {
    	try
    	{
    		Object aab102=this.get("aab102");
    		Object aab101=this.get("aab101");
    		StringBuilder sql = new StringBuilder()
					    		.append("update ab01 ")
					    		.append("   set aab102 = ?")
					    		.append(" where aab101 = ?")
					    		;
    		Object args[]=
    			{
        			aab102,	
        			aab101
    			};
    		return this.executeUpdate(sql.toString(), args)>0;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
    
    //用户修改密码
    public boolean updatePassword()throws Exception
    {
    	try
    	{
	    	Object aab101 = this.get("aab101");
	    	Object oaab104 = Tools.getMd5(this.get("oaab104"));
	    	Object naab104 = Tools.getMd5(this.get("naab104"));
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101")	
	    			.append("  from ab01 a")
	    			.append(" where a.aab101=? and a.aab104=?")
	    			;
	    	List<Object> paramList =new ArrayList<>();
	    	paramList.add(aab101);
	    	paramList.add(oaab104);
	    	if(this.queryForMap(sql.toString(), paramList.toArray())!=null)
	    	{
	    		StringBuilder sql2 = new StringBuilder()
			    		.append("update ab01 ")
			    		.append("   set aab104 = ?")
			    		.append(" where aab101 = ?")
			    		;
	    		List<Object> paramList2 =new ArrayList<>();
		    	paramList2.add(naab104);
		    	paramList2.add(aab101);
		    	return this.executeUpdate(sql2.toString(), paramList2.toArray())>0;
	    	}
	    	else
	    	{
	    		return false;
	    	}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		return false;
    	}
    }
	/**
	 * 加经验值
	 * 
	 * @return
	 * @throws Exception
	 */
	protected final boolean addExp(Object aab101, String expType) throws Exception 
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
		return this.executeUpdate(sql, args) > 0;
	}

	//加经验值
	protected final boolean addExp(Object userId,Object exp) throws Exception
	{
		String sql = "update ab01 set aab107 = aab107+? where aab101=?";
		Object args[] = 
			{ 
				userId, 
				exp 
			};
		return this.executeUpdate(sql, args) > 0;
	}
	/**
	 * 打赏扣钱和加钱
	 * 
	 * @return
	 * @throws Exception
	 */
	private boolean reward() throws Exception 
	{
		Object aab101 = this.get("aab101");
		Object paab101 = this.get("paab101");
		if (getMoney(aab101) >=5) 
		{
			String sql1 = "update ab01 set aab106 = aab106-5 where aab101=?";
			this.apppendSql(sql1, aab101);
			String sql2 = "update ab01 set aab106 = aab106+5 where aab101=?";
			this.apppendSql(sql2, paab101);
			Boolean tag = this.executeTransaction();
			this.setMessage(tag ? "打赏成功,当前余額为"+ getMoney(aab101) : "发生了未知错误,当前余額为" + getMoney(aab101));
			if(Tools.completeMission(aab101, 3))
			{
			Tools.sendMessage("恭喜你完成每日任务_打赏，获得经验5点，M点5点！", aab101);
			}
			return tag;
		}
		else 
		{
			this.setMessage("余额不够,当前余額为" + getMoney(aab101));
			return false;
		}
	
	}
 

	/**
	 * 指定帖子查询的加载(帖子 回复 收藏状态)
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> postFindById() throws Exception 
	{
		Ab05ServicesImpl ab05 = new Ab05ServicesImpl();
		int nowFloor =  1;
		if (isNotNull(this.get("nowFloor"))) 
		{
			nowFloor = Integer.valueOf((String)this.get("nowFloor"));
		}
		return ab05.postFindById(this.get("aab101") , this.get("aab501"),nowFloor);
	}
	
    private boolean addEmp()throws Exception
    {
    	//获取当前员工编号
    	String aab103=Tools.getEmpNumber();
    	//向DTO添加员工编号
    	this.put("aab103", aab103);
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aab102"),
    			aab103,
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean batchDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ab01 where aab101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }

    public Map<String,Object> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109 ")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
      
    public Map<String,Object> articleFindById()throws Exception
    {
		Object aab801 =  this.get("aab801");
		Ab08ServicesImpl ab08 =new Ab08ServicesImpl();
    	return ab08.findById(aab801);
    }
    
      /**
       * 不定条件查询
       * @return
       * @throws Exception
       */
	public List<Map<String,Object>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aab102=this.get("qaab102");     //姓名  模糊查询
	  		Object aab103=this.get("qaab103");     //编号
	  		Object aab105=this.get("qaab105");     //性别
	  		Object aab106=this.get("qaab106");     //民族
	  		Object baab104=this.get("baab104");    //生日B
	  		Object eaab104=this.get("eaab104");    //生日E
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" and x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
	  		}
	  		if(this.isNotNull(aab103))
	  		{
	  			sql.append(" and x.aab103=?");
	  			paramList.add(aab103);
	  		}
	  		if(this.isNotNull(aab105))
	  		{
	  			sql.append(" and x.aab105=?");
	  			paramList.add(aab105);
	  		}
	  		if(this.isNotNull(aab106))
	  		{
	  			sql.append(" and x.aab106=?");
	  			paramList.add(aab106);
	  		}
	  		if(this.isNotNull(baab104))
	  		{
	  			sql.append(" and x.aab104>=?");
	  			paramList.add(baab104);
	  		}
	  		if(this.isNotNull(eaab104))
	  		{
	  			sql.append(" and x.aab104<=?");
	  			paramList.add(eaab104);
	  		}
	  		
	  		sql.append(" order by x.aab102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }


}