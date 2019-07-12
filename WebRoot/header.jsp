
<%@ page language="java" 
    pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String aab101=(String)session.getAttribute("aab101");
String aab102=(String)session.getAttribute("aab102");

String aab108=(String)session.getAttribute("aab108");
String path=request.getContextPath();
%>


<div id="nav" >
	
		    <form action="<%=path%>/queryBet.html" method="post">			
		<input type="hidden" name="aab101" value="<%=aab101%>">
		    	<button style="submit" >竞猜</button>
		    	<button style="submit" formaction="<%=path%>/queryArticle.html">文章</button>
		   		<button style="submit" formaction="<%=path%>/forum.html">论坛</button>
		    </form>
	
	
		    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:15;right:0;width:300;height:10;z-index:1;visibility:visible;"> 
			<span id="menubar" style="width:300" > 
				<font color=red size=2>
				   <c:if test="${aab108==2}">管理员  <%=aab102%></c:if>
			 	   <c:if test="${aab108==1}">用户  <%=aab102%></c:if>
				   <c:if test="${aab108==null}">游客</c:if>
				 
				</font>
			</span> 
			<!--实现鼠标悬停出现菜单  -->
				<div id="menu" style="position:absolute;top:15;right:0;width:300;height:10;z-index:2;visibility:hidden;"> 
					
					<form action ="<%=path%>/queryPerson.html" method="post">
						<input type="hidden" name="aab101" value="<%=aab101%>">
						<input type="submit" name="toLog" formaction="<%=path%>/login.jsp" value="登录与注册"><BR>
						 <c:if test="${aab108!=null}">
						 		<input type="submit"  name="toQpi" formnovalidate="formnovalidate" value="个人信息">
						</c:if>
					  	 <c:if test="${aab108==null}">
			       				<input type="submit" name="psgToLog" value="个人信息" formaction="<%=path%>/login.jsp">
			     	     </c:if>
					</form>

				</div> 
			</div> 


</div>
aab101=<%=aab101%>
<br>
aab108=<%=aab108%>
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
