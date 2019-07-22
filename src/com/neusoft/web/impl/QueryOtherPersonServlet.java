package com.neusoft.web.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.services.impl.Ab05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

@WebServlet(name = "QueryOtherPersonServlet",value = "/queryOtherPerson.htm",loadOnStartup=0)
@MultipartConfig
public class QueryOtherPersonServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
	
		Map<String, Object> dto=this.createDto(request);
		Ab01ServicesImpl ab01 = new Ab01ServicesImpl();
		try
		{
		Map<String,Object> qins = ab01.queryPerson(dto.get("qaab101"));
		request.setAttribute("qins", qins);

		}catch(Exception e)
		{
			e.printStackTrace();	
		}
		Ab05ServicesImpl ab05 = new Ab05ServicesImpl();
		try
		{
		List<Map<String,Object>> rows = ab05.queryHistory(dto.get("qaab101"));
		request.setAttribute("rows", rows);
		}catch(Exception e)
		{
			e.printStackTrace();	
		}
	
		request.getRequestDispatcher("queryOtherPerson.jsp").forward(request, response);
    }
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	    {
	    	
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
			System.out.println(dto);
			return dto;
		}


}
