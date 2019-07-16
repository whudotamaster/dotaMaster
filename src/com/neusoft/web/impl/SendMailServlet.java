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
			Map<String, String[]> tem=request.getParameterMap();//���ҳ������

			String aab101=tem.get("aab101")[0];
			String admin=tem.get("admin")[0];
			String violation=tem.get("violation")[0];
			String time=tem.get("time")[0];
			String details=tem.get("details")[0];

						
	        Properties properties = new Properties();
	        properties.put("mail.transport.protocol", "smtp");// ����Э��
	        properties.put("mail.smtp.host", "smtp.qq.com");// ������
	        properties.put("mail.smtp.port", 465);// �˿ں�
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.ssl.enable", "true");// �����Ƿ�ʹ��ssl��ȫ���� ---һ�㶼ʹ��
	        properties.put("mail.debug", "true");// �����Ƿ���ʾdebug��Ϣ true ���ڿ���̨��ʾ�����Ϣ
	        // �õ��ػ�����
	        Session session = Session.getInstance(properties);
	        // ��ȡ�ʼ�����
	        Message message = new MimeMessage(session);
	        // ���÷����������ַ
	        message.setFrom(new InternetAddress("1655480118@qq.com"));
	        //�ҵ����䣬��Ϊ��������
	        // �����ռ��������ַ 
	        message.setRecipients(Message.RecipientType.TO, 
	        		new InternetAddress[]{
	        				//���¹����ܺ�������
	        				new InternetAddress("7005881@qq.com")        				
//	        				new InternetAddress("452181717@qq.com"),
//	        				new InternetAddress("2368392847@qq.com"),//�����ֺ������ֵ�����
//	        				new InternetAddress("623582881@qq.com")
	        				});
	        //С���������˵����� ���Ƕ���boss �����ռ�
	        //message.setRecipient(Message.RecipientType.TO, new InternetAddress("xxx@qq.com"));//һ���ռ���
	        // �����ʼ�����
	        message.setSubject("�û�"+aab101+"Ͷ��");
	        
	        // �����ʼ�����
	        String text="Ͷ�ߵĹ���ԱΪ"+admin
	    	        +",\r\nͶ�ߵ�Υ�����Ϊ"+violation
	    	        +",\r\n����ʱ��Ϊ"+time
	    	        +",\r\n��ϸ��Ϣ��"+details;
	        message.setText(text);
	        // �õ��ʲ����
	        Transport transport = session.getTransport();
	        // �����Լ��������˻�
	        transport.connect("1655480118@qq.com", "nswouejkahebibag");// ����ΪQQ���俪ͨ��stmp�����õ��Ŀͻ�����Ȩ��
	        // �����ʼ�
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
			request.setAttribute("msg", "��ʾ���ѷ��������䣬��ȴ���վboss����");
		}
		else
		{
			request.setAttribute("msg", "��ʾ������ʧ��");
		}
		request.getRequestDispatcher("sendMail.jsp").forward(request, response);

		
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}