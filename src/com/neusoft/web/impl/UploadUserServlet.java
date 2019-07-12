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
使用注解MultipartConfig 将一个 Servlet 标识为支持文件上传。Servlet3.0 将
multipart/form-data 的 POST 请求封装成 Part，通过 Part 对文件进行上传。
Servlet3 没有提供直接获取文件名的方法,需要从请求头中解析出来
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