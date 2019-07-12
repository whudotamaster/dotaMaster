package com.neusoft.web.impl;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value="/sendMail.htm",loadOnStartup=0)
public class SendMailServlet extends HttpServlet 
{
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean ins=false;
		try
		{
			Map<String, String[]> tem=request.getParameterMap();//获得页面数据

			String aab101=tem.get("aab101")[0];
			String admin=tem.get("admin")[0];
			String violation=tem.get("violation")[0];
			String time=tem.get("time")[0];
			String details=tem.get("details")[0];

						
	        Properties properties = new Properties();
	        properties.put("mail.transport.protocol", "smtp");// 连接协议
	        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
	        properties.put("mail.smtp.port", 465);// 端口号
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
	        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
	        // 得到回话对象
	        Session session = Session.getInstance(properties);
	        // 获取邮件对象
	        Message message = new MimeMessage(session);
	        // 设置发件人邮箱地址
	        message.setFrom(new InternetAddress("1655480118@qq.com"));
	        //我的邮箱，作为发件邮箱
	        // 设置收件人邮箱地址 
	        message.setRecipients(Message.RecipientType.TO, 
	        		new InternetAddress[]{
	        				//以下公布受害人名单
	        				new InternetAddress("7005881@qq.com")        				
//	        				new InternetAddress("452181717@qq.com"),
//	        				new InternetAddress("2368392847@qq.com"),//二把手和三把手的邮箱
//	        				new InternetAddress("623582881@qq.com")
	        				});
	        //小组其他三人的邮箱 他们都是boss 负责收件
	        //message.setRecipient(Message.RecipientType.TO, new InternetAddress("xxx@qq.com"));//一个收件人
	        // 设置邮件标题
	        message.setSubject("用户"+aab101+"投诉");
	        
	        // 设置邮件内容
	        String text="投诉的管理员为"+admin
	    	        +",\r\n投诉的违规操作为"+violation
	    	        +",\r\n发生时间为"+time
	    	        +",\r\n详细信息："+details;
	        message.setText(text);
	        // 得到邮差对象
	        Transport transport = session.getTransport();
	        // 连接自己的邮箱账户
	        transport.connect("1655480118@qq.com", "nswouejkahebibag");// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
	        // 发送邮件
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
	        ins=true; 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(ins==true)
		{
			request.setAttribute("msg", "提示：已发送至邮箱，请等待网站boss处理");
		}
		else
		{
			request.setAttribute("msg", "提示：发送失败");
		}
		request.getRequestDispatcher("sendMail.jsp").forward(request, response);

		
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}