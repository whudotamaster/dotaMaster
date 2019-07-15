package com.neusoft.web.support;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.neusoft.services.BaseServices;
import com.neusoft.services.impl.Ab01ServicesImpl;
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
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void adminQueryArticleServ()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminQueryArticle();
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
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void adminQueryComplainServ()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminQueryComplain();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	
	
	

	/*****************************************
	 * 	        ��̳����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ��������������ѯ
	 * @throws Exception
	 */
	protected final void forumOnLoad()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryPost();
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
		List<Map<String,String>> rows=null;
		if(methodName.equals("buy"))
			rows=this.services.queryBuyOrder();
		else if(methodName.equals("sell"))
			rows=this.services.querySellOrder();
		else if(methodName.equals("FBIforMore"))
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
	


	/*****************************************
	 * 	        ������ϸ������ҵ�����̷�װ
	 *****************************************/
	/**
	 * �������ݲ�ѯ
	 * @throws Exception
	 */
	protected final void postOnLoad()throws Exception
	{
		List<Map<String,String>> rows=this.services.postFindById();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	/*****************************************
	 * 	        �ղ�ҳ�����ҵ�����̷�װ
	 *****************************************/
	/**
	 * �Ñ��ղ����ݲ�ѯ
	 * @throws Exception
	 */
	protected final void collectionOnLoad()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryCollectionList();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	/*****************************************
	 * 	        �û���ʷ����ҳ�����ҵ�����̷�װ
	 *****************************************/
	/**
	 * �Ñ���ʷ�������ݲ�ѯ
	 * @throws Exception
	 */
	protected final void queryHistoryOnLoad()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryHistory();
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
			this.saveAttribute("msg", this.services.getMessage());
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	//��¼�ж�
	protected final boolean loginIn()throws Exception
	{
		Map<String, String> ins=this.services.loginEmp();
		//System.out.println("��loginIn��ʵ����һ��");

		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
			//System.out.println(ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "��ʾ����½ʧ��");
			//System.out.println("login false����");
			return false;
		}
	}
	
	//�û�ע��
	protected final boolean logonIn()throws Exception
	{		
			int ins=this.services.logonPerson();
			System.out.println("��logonIn��ʵ����һ��");
			
			switch(ins)
			{
			case 0:
				this.saveAttribute("msg", "��ʾ��ע��ɹ������¼");
				System.out.println("logon true����"+ins);				
				return true;
			case 1000:
				this.saveAttribute("msg", "��ʾ��ע��ʧ�ܣ����û����Ѵ���");
				System.out.println("logon false����"+ins);
				return false;
			case 2000:
				this.saveAttribute("msg", "��ʾ��ע��ʧ�ܣ�������С��15�ֳ��ȵ��û���������");
				System.out.println("logon false����"+ins);
				return false;
			case 3000:
				this.saveAttribute("msg", "��ʾ��ע��ʧ�ܣ��������û���������");
				System.out.println("logon false����"+ins);
				return false;
			}
			return false;
	}
	
	//��ѯ�û���Ϣ
	protected final void queryPersonIn() throws Exception
	{
		Map<String,String> ins=this.services.queryPersonEmp();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:�û���Ϣ��ȡ����!");	
		}	
	}
	
	//�û����ݸ���
	protected final boolean updtPsnInfIn() throws Exception
	{
		try
		{
			boolean ins = this.services.personUpdateEmp();
			if(ins=true)
			{
				this.saveAttribute("updpsnbool",  ins);
				this.saveAttribute("msg", "��ʾ:�û���Ϣ���ĳɹ�!");	
				

				System.out.println(ins);
				return true;
			}
			else
			{
				this.saveAttribute("msg", "��ʾ:�û���Ϣ���Ĵ���!");	
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
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> executeQueryMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (List<Map<String, String>>)method.invoke(services);
	}
	
	protected final void query(String methodName)throws Exception
	{
		List<Map<String,String>> rows=this.executeQueryMethod(methodName);
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
			this.saveAttribute("msg", "ʧ��"+this.getServices().getMessage());
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
		String msg=typeText+"ʧ��!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	System.out.println(this.dto.get(key));
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
