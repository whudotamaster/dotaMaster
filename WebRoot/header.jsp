
<%@ page language="java" 
    pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String aab101=(String)session.getAttribute("aab101");
String path=request.getContextPath();
%>
<!-- �˴�form��Ҫɾ������Ҫɾ������Ҫɾ���� -->
<form method=post>
<div id="nav" >
	  <ul>
		    <li ><a href="">Ӣ��</a></li>
		    <li><a href="">��Ʒ</a></li>
		    <li><a href="">��Ʒ�̳�</a></li>
		    <li><a href="">��̳</a></li>
		    <li><a href="<%=path%>/queryBet.jsp">Ѻע</a></li>
		    <li><a href="">����6</a></li>
	  </ul>
		    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:225;left:250;width:160;height:40;z-index:1;visibility:visible;"> 
			<span id="menubar" > 
				<font color=red size=2>${ins.aab102} </font>
			</span> 
			<!--ʵ�������ͣ���ֲ˵�  -->
				<div id="menu" style="position:absolute;top:15;left:0;width:150;height:10;z-index:2;visibility:hidden;"> 
					<a id="toSignIn" href="login.jsp">��¼</a> <br>
					<a id="toUpdPsnInf" href="queryPerson.html">�޸ĸ�����Ϣ</a> <br>
					<a id="link" href="LINK3.htm">LINK3</a> <br>
					<a id="link" href="LINK4.htm">LINK4</a> <br>
					<a id="link" href="LINK5.htm">LINK5</a> <br>
					<a id="link" href="LINK6.htm">LINK6</a> <br>
				</div> 
			</div> 
	
      			 <e:text name="aab101" required="true" value="${ins.aab101 }"/>
			<button style="submit" formaction="<%=path%>/queryPerson.html" formnovalidate="formnovalidate">�޸ĸ�����Ϣ</button>
			
</div>
<%=aab101%>
	<SCRIPT language=javascript>
		<!-- 
		function out() 
		{ 
			if(window.event.toElement.id!="menu" && window.event.toElement.id!="link") 
			menu.style.visibility="hidden"; 
		} 
		//--> 
		function out1() 
		{ 
			if(window.event.toElement.id!="menu1" && window.event.toElement.id!="link") 
			menu1.style.visibility="hidden"; 
		} 
		//--> 
	</SCRIPT> 
