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
	 * 	        业务逻辑组件及架构注入
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
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
	 * 	        子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/**
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	/**
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,Object>> executeQueryMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/**
	 * 通过反射执行findById方法
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	/**
	 * 通过反射执行更新方法 return Map
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private Map<String,Object> executeQueryMethodMap(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
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
	
	//为报错信息多种情况进行了封装
	protected final void update(String methodName)throws Exception
	{
		this.executeUpdateMethod(methodName);
		this.saveAttribute("msg",this.services.getMessage());
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
		if(this.executeUpdateMethod(methodName))
		{
			this.saveAttribute("msg", msgText+"成功");
		}
		else
		{
			this.saveAttribute("msg", "失败  : "+this.services.getMessage());
		}
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
    	if(this.executeUpdateMethod(methodName))
    	{
    		String msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    		this.saveAttribute("msg", msg);
    	}
    	else
    	{
    		this.saveAttribute("msg", "失败  : "+this.services.getMessage());
    	}

	}
	
	/**
	 * 删除后的数据检索
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
