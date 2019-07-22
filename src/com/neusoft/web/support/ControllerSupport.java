package com.neusoft.web.support;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.BaseServices;
import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.system.tools.Tools;
import com.sun.jmx.snmp.tasks.ThreadService;
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
		List<Map<String,Object>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{	
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}

	
	
	protected final void savePageData(String methodName)throws Exception
	{
		List<Map<String,Object>> rows=null;
		if(methodName.equals("FBIforMore"))
			rows=this.services.FBIforMore();
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
		Map<String,Object> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			//this.saveAttribute("msg", this.services.getMessage());
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	/**
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,Object>> executeQueryMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (List<Map<String, Object>>)method.invoke(services);
	}
	
	protected final void query(String methodName)throws Exception
	{
		List<Map<String,Object>> rows=this.executeQueryMethod(methodName);
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
	 * ͨ������ִ��findById����
	 * @param methodName
	 * @return
	 * @throws Exception
	 */

	protected final void findById(String methodName)throws Exception
	{
		List<Map<String, Object>> rows2=this.executeQueryMethod(methodName);
		if(rows2.size()>0)
		{
			this.saveAttribute("rows2", rows2);
		}
		else
		{	
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	/**
	 * ͨ������ִ�и��·��� return Map
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private Map<String,Object> executeQueryMethodMap(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (Map<String, Object>)method.invoke(services);
	}
	
	protected final void queryMap(String methodName)throws Exception
	{
		Map<String, Object> ins=this.executeQueryMethodMap(methodName);
		if(ins.size()>0)
		{
			this.saveAttribute("ins", ins);
		}
		else
		{	
			this.saveAttribute("msg", "û�з�������������!");
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
	
	//Ϊ������Ϣ������������˷�װ
	protected final void update(String methodName)throws Exception
	{
		this.executeUpdateMethod(methodName);
		this.saveAttribute("msg",this.services.getMessage());
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
		if(this.executeUpdateMethod(methodName))
		{
			this.saveAttribute("msg", msgText+"�ɹ�");
		}
		else
		{
			this.saveAttribute("msg", "ʧ��  : "+this.services.getMessage());
		}
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
    	if(this.executeUpdateMethod(methodName))
    	{
    		String msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    		this.saveAttribute("msg", msg);
    	}
    	else
    	{
    		this.saveAttribute("msg", "ʧ��  : "+this.services.getMessage());
    	}

	}
	
	/**
	 * ɾ��������ݼ���
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,Object>> rows=this.services.query();
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
