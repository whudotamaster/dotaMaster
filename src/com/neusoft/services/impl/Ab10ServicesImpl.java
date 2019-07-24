
package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ab10ServicesImpl extends JdbcServicesSupport 
{
	
	//��ѯ���û����տ�������� ʹ�ü�����ѯ
	public List<Map<String, Object>> query() throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("SELECT a.aab901,a.aab902,a.aab903,a.aab904,a.aab905,")
				.append("		b.aab1001,b.aab1002,b.aab101")
				.append("  FROM ab09 a,ab10 b")
				.append(" WHERE b.aab101=? and b.aab901=a.aab901")
				.append(" ORDER BY b.aab1002")
				
				;
		//aab1002 0Ϊ�����  1Ϊ�����
		return this.queryForList(sql.toString(),this.get("aab101"));
	}

	//ע��ʱ����������
	public boolean insert(Object userId)throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("insert into ab10")
    			.append("(aab101,aab901,aab1002)") 	
    			.append("values (?,?,0)")
       			;
    	Object args[]={
    		1,
    		2,
    		3,
    		4,
    		5,
    		6,
    		7
    	};
    	for(Object a:args)
    	{
    		Object arg[]={userId,a};
    		this.apppendSql(sql.toString(), arg);
    	}
    	return executeTransaction();
	}
	//�޸������û����״̬
	public boolean update(Object userId,Object missionId)throws Exception
	{
		StringBuilder sql = new StringBuilder()
					.append("UPDATE ab10 SET aab1002 = 1 WHERE aab101 = ? AND aab901 = ?")
					;
		Object args[] = {userId,missionId};
		if(!this.isComplete(userId, missionId))
		{
			this.executeUpdate(sql.toString(),args);
			this.execute(userId, missionId);
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	//��ȡĳһ����ĳ�û����״̬,�����Ϊtrue������ûɶ��
	private boolean isComplete(Object userId,Object missionId)throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("SELECT * FROM ab10 WHERE aab101 = ?  AND aab901 = ? AND aab1002 = 1")
				;
		Object args[] = {userId,missionId};
		return this.queryForMap(sql.toString(), args)!=null;
	}
	//��ѯ��̬����������ݣ�ab09��
	private Map<String,Object> missionQuery(Object missionId)throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("SELECT * FROM ab09 WHERE aab901 = ?")
				;
		return this.queryForMap(sql.toString(), missionId);
	}
	
	//������������޸�ab01��
	private boolean execute(Object userId,Object missionId)throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map = this.missionQuery(missionId);
		Object missionRwd = map.get("aab904");
		Object missionExp = map.get("aab905");
		Ab01ServicesImpl ab01 = new Ab01ServicesImpl();
		return ab01.updateMoney(missionRwd, userId)==true&&ab01.addExp(userId, missionExp)==true;
	}
}

