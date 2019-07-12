package com.neusoft.web.impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.omg.PortableServer.THREAD_POLICY_ID;

import com.neusoft.services.impl.Ab01ServicesImpl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by foreknow on 2018/12/13.
MultipartConfig
ʹ��ע��MultipartConfig ��һ�� Servlet ��ʶΪ֧���ļ��ϴ���Servlet3.0 ��
multipart/form-data �� POST �����װ�� Part��ͨ�� Part ���ļ������ϴ���
Servlet3 û���ṩֱ�ӻ�ȡ�ļ����ķ���,��Ҫ������ͷ�н�������
 */
@WebServlet(name = "UploadUserServlet",value = "/uploadUser.htm",loadOnStartup=0)
@MultipartConfig
public class UploadUserServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        Part part = request.getPart("file");
        String name = part.getSubmittedFileName();
        UUID uuid = UUID.randomUUID();

        String path = request.getServletContext().getRealPath("")+"/pic/";
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
   
        part.write(path+uuid+name);
        request.getSession().setAttribute("pic",uuid+name);
        
        Ab01ServicesImpl ab01=new Ab01ServicesImpl();
        try 
        {	
			ab01.updatePic(request.getSession().getAttribute("aab101"),path+uuid+name);
		} 
        catch (Exception e) 
        {			
			e.printStackTrace();
		}   
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    }
}