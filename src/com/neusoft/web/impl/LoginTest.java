package com.neusoft.web.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.neusoft.services.impl.Ab01ServicesImpl;


@WebServlet(value="/login.html",loadOnStartup=1)
public class LoginTest extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Ab01ServicesImpl ab01=new Ab01ServicesImpl();
		Map<String, Object> dto=this.createDto(request);
		Map<String, String> ins=null;
		try 
		{
			ins = ab01.loginEmp(dto.get("aab103"),dto.get("aab104"));
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ins!=null)
		{
			request.setAttribute("ins", ins);
			request.getSession().setAttribute("aab101", ins.get("aab101"));//用戶ID
			request.getSession().setAttribute("aab102", ins.get("aab102"));//用戶昵称
			request.getSession().setAttribute("aab105", ins.get("aab105"));//用戶头像
			request.getSession().setAttribute("aab106", ins.get("aab106"));//用戶余额
			request.getSession().setAttribute("aab108", ins.get("aab108"));//用戶权限
			request.getRequestDispatcher("mainPage.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	
	
	/**
	 *  DTO切片
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.获取页面数据
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.导出所有键值对,形成键值对集合
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.定义数组,表示Entry的value部分
		String value[]=null;
		
		//4.定义DTO容器
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.循环读取entrySet,获取每个键值对
		for(Entry<String,String[]> entry :entrySet)
		{
			//获取value部分的数组
			value=entry.getValue();
			//依据长度判断页面控件的类别
			if(value.length==1)  //非checkbooks类控件
			{
		        //过滤掉页面未填充项目
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //Checkbooks类控件
			{
				dto.put(entry.getKey(), value);
			}	
		}
		//System.out.println(dto);
		return dto;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
