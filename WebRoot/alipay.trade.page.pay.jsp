<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>����</title>
</head>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.net.*" %>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%
	//��ó�ʼ����AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
    //�̻������ţ��̻���վ����ϵͳ��Ψһ�����ţ�����
    String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"GBK");
    //���������
    String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"GBK");
    //�������ƣ�����
    String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"GBK");
    //��Ʒ�������ɿ�
    String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"GBK");
    //out.print(URLDecoder.decode(subject,"utf-8"));

	//�����������
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
 	if(subject=="vip")
	{
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	}else 
	{
		alipayRequest.setReturnUrl(AlipayConfig.return_url_c);
	} 
	

	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	
	//�����BizContent����������ѡ����������������Զ��峬ʱʱ�����timeout_express������˵��
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//��������ɲ��ġ�������վ֧����API�ĵ�-alipay.trade.page.pay-����������½�
	
	//����
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//���
	out.println(result);
%>
<body>
</body>
</html>