package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;


public class AdminImpl extends JdbcServicesSupport {
	
	//�õ�����˵���������
		public  int countArticle()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aab801   from ab08   where aab804 = 1  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//ͳ���账���Ͷ��
		public  int countComplain()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad501   from ad05   where aad504 = 1  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//ͳ����Ҫ���͵���Ʒ
		public  int countSendAcc()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad401   from ad04   where aad403 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//ͳ����Ҫ���յ���Ʒ
		public  int countGetAcc()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aad301   from ad03   where aad303 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
		//ͳ��δ��ɵı���
		public  int countMatch()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	  				.append(" select  aac1101   from ac11   where aac1105 = 0  ")
	  				;
			return this.queryForList(sql.toString()).size();
		}
}
