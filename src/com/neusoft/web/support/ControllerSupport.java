package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        业务逻辑组件及架构注入
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		System.out.println("setServices成功运行");
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/*****************************************
	 * 	        论坛加载业务流程封装
	 *****************************************/
	/**
	 * 帖子数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/*****************************************
	 * 	        帖子详细頁面加载业务流程封装
	 *****************************************/
	/**
	 * 帖子数据查询
	 * @throws Exception
	 */
	protected final void postOnLoad()throws Exception
	{
		List<Map<String,String>> rows=this.services.postFindById();
		List<Map<String,String>> comment=this.services.commentFindById();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
			this.saveAttribute("comment", comment);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/**
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	//登录判断
	protected final boolean loginIn()throws Exception
	{
		List<Map<String, String>> ins=this.services.loginEmp();
		System.out.println("在loginIn中实例化一次");

		if(ins.size()>0)
		{
			this.saveAttribute("ins", ins);
			System.out.println(ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "提示：登陆失败");
			System.out.println("login false运行");
			return false;
		}
		
	}
	
	//用户注册
	protected final boolean logonIn()throws Exception
	{
		
			int ins=this.services.logonEmp();
			System.out.println("在logonIn中实例化一次");
			
			switch(ins)
			{
			case 0:
				this.saveAttribute("msg", "提示：注册成功，请登录");
				System.out.println("logon true运行"+ins);				
				return true;
			case 1000:
				this.saveAttribute("msg", "提示：注册失败，该用户名已存在");
				System.out.println("logon false运行"+ins);
				return false;
			case 2000:
				this.saveAttribute("msg", "提示：注册失败，请输入小于15字长度的用户名或密码");
				System.out.println("logon false运行"+ins);
				return false;
			case 3000:
				this.saveAttribute("msg", "提示：注册失败，请输入用户名或密码");
				System.out.println("logon false运行"+ins);
				return false;
			}
			return false;
			
			
			
			
			
			
			
			

	}
	
	
	
	
	/**
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * 更新行为的总开关
	 * <
	 *   简单消息提示
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * 带有编号的消息提示的更新行为
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet向页面输出数据
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * 删除后的数据检索
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
	 * 	        数据输入流
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //同步为Services传递DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        数据输出流
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
