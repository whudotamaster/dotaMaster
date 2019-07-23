package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;


public class AdminImpl extends JdbcServicesSupport {
	
	//得到待审核的文章数量
		public  int countArticle()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aab801   from ab08   where aab804 = 1  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//统计需处理的投诉
		public  int countComplain()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad501   from ad05   where aad504 = 1  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//统计需要发送的饰品
		public  int countSendAcc()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad401   from ad04   where aad403 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//统计需要接收的饰品
		public  int countGetAcc()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad301   from ad03   where aad303 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//统计未完成的比赛
		public  int countMatch()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aac1101   from ac11   where aac1105 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
}
