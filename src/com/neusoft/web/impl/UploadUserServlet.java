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
import java.util.Map;
import java.util.UUID;

/**
 * Created by foreknow on 2018/12/13.
MultipartConfig
使用注解MultipartConfig 将一个 Servlet 标识为支持文件上传。Servlet3.0 将
multipart/form-data 的 POST 请求封装成 Part，通过 Part 对文件进行上传。
Servlet3 没有提供直接获取文件名的方法,需要从请求头中解析出来
 */
@MultipartConfig
public class UploadUserServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
      	
     
    
        Part part = request.getPart("file");
        String name = part.getSubmittedFileName();
        UUID uuid = UUID.randomUUID();
        String path = "D:/Avatar/";
        File file = new File(path);
        if (!file.exists())
        {
            file.mkdirs();
        }   
        part.write(path+uuid+name);
        request.getSession().setAttribute("pic",uuid+name);
        try 
        {	  
        	//删掉老的
        	Ab01ServicesImpl ab01=new Ab01ServicesImpl();
        	String oldAvatar = (String)ab01.queryPersonEmp(request.getSession().getAttribute("aab101")).get("aab105");
        	if(!oldAvatar.equals("默认头像.png"))
        	{
        	this.deleteFile( "D:/Avatar/"+oldAvatar);
        	}
        //换新的
        	ab01.updatePic(request.getSession().getAttribute("aab101"),uuid+name);

			request.setAttribute("msg", "提示：上传头像成功！");
			request.getRequestDispatcher("queryPerson.html").forward(request, response);
		} 
        catch (Exception e) 
        {			
			e.printStackTrace();
		}   
    }

    /** 
     * 删除单个文件 
     * @param   sPath    被删除文件的文件名 
     * @return 单个文件删除成功返回true，否则返回false 
     */  
    public boolean deleteFile(String sPath) 
    {  
       boolean flag = false;  
        File file = new File(sPath);  
        // 路径为文件且不为空则进行删除  

        if (file.isFile() && file.exists()) 
        {
        	
            file.delete();  
            flag = true;  
        }  
        return flag;  
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    }
}
