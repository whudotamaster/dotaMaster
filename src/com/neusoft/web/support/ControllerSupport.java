package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        ҵ���߼�������ܹ�ע��
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		System.out.println("setServices�ɹ�����");
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        ����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	/**
	 * ��һʵ�� ��ѯ
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	//��¼�ж�
	protected final boolean loginIn()throws Exception
	{
		List<Map<String, String>> ins=this.services.loginEmp();
		if(ins.size()>0)
		{
			this.saveAttribute("ins", ins);
			System.out.println(ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "��ʾ����½ʧ��");
			System.out.println("login false����");
			return false;
		}
		
	}
	
	//�û�ע��
	protected final boolean logonIn()throws Exception
	{
		int ins=this.services.logonEmp();
		if(ins!=0)
		{
			this.saveAttribute("msg", "��ʾ��ע��ɹ������¼");
			System.out.println(ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "��ʾ��ע��ʧ�ܣ����û����Ѵ���");
			System.out.println("login false����");
			return false;
		}
	}
	
	
	
	
	/**
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * ������Ϊ���ܿ���
	 * <
	 *   ����Ϣ��ʾ
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"�ɹ�!":"ʧ��!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"ʧ��!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet��ҳ���������
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * ɾ��������ݼ���
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	
	
	/*****************************************
	 * 	        ����������
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //ͬ��ΪServices����DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        ���������
	 *****************************************/
    private Map<String,Object> attribute=new HashMap<>();
    protected final void  saveAttribute(String key,Object value)
    {
    	this.attribute.put(key, value);
    }
    
    @Override
    public final Map<String, Object> getAttribute() 
    {
    	return this.attribute;
    }
}
