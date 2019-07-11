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
			request.getSession().setAttribute("aab101", ins.get("aab101"));//�Ñ�ID
			request.getSession().setAttribute("aab102", ins.get("aab102"));//�Ñ��ǳ�
			request.getSession().setAttribute("aab105", ins.get("aab105"));//�Ñ�ͷ��
			request.getSession().setAttribute("aab106", ins.get("aab106"));//�Ñ����
			request.getSession().setAttribute("aab108", ins.get("aab108"));//�Ñ�Ȩ��
			request.getRequestDispatcher("mainPage.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	
	
	/**
	 *  DTO��Ƭ
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.��ȡҳ������
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.�������м�ֵ��,�γɼ�ֵ�Լ���
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.��������,��ʾEntry��value����
		String value[]=null;
		
		//4.����DTO����
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.ѭ����ȡentrySet,��ȡÿ����ֵ��
		for(Entry<String,String[]> entry :entrySet)
		{
			//��ȡvalue���ֵ�����
			value=entry.getValue();
			//���ݳ����ж�ҳ��ؼ������
			if(value.length==1)  //��checkbooks��ؼ�
			{
		        //���˵�ҳ��δ�����Ŀ
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //Checkbooks��ؼ�
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
