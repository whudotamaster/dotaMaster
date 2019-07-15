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

	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	

	
	/**
	 * 数据批量查询
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
	 * 	        收藏页面加载业务流程封装
	 *****************************************/
	/**
	 * 用戶收藏数据查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/*****************************************
	 * 	        用户历史发帖页面加载业务流程封装
	 *****************************************/
	/**
	 * 用戶历史发帖数据查询
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
			this.saveAttribute("msg", this.services.getMessage());
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	//登录判断
	protected final boolean loginIn()throws Exception
	{
		Map<String, String> ins=this.services.loginEmp();
		//System.out.println("在loginIn中实例化一次");

		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
			//System.out.println(ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "提示：登陆失败");
			//System.out.println("login false运行");
			return false;
		}
	}
	
	//用户注册
	protected final boolean logonIn()throws Exception
	{		
			int ins=this.services.logonPerson();
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
	
	//查询用户信息
	protected final void queryPersonIn() throws Exception
	{
		Map<String,String> ins=this.services.queryPersonEmp();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:用户信息获取错误!");	
		}	
	}
	
	//用户数据更新
	protected final boolean updtPsnInfIn() throws Exception
	{
		try
		{
			boolean ins = this.services.personUpdateEmp();
			if(ins=true)
			{
				this.saveAttribute("updpsnbool",  ins);
				this.saveAttribute("msg", "提示:用户信息更改成功!");	
				

				System.out.println(ins);
				return true;
			}
			else
			{
				this.saveAttribute("msg", "提示:用户信息更改错误!");	
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
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> executeQueryMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
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
			this.saveAttribute("msg", "失败"+this.getServices().getMessage());
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
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	System.out.println(this.dto.get(key));
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
