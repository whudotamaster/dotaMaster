<%@ page language="java" 
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    <style type="text/css">
   body
  {
  color:black;
  }
       .demo{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/bg.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
        .demo2{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/huonv.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
    </style>
</head>
<%
String aab101=(String)session.getAttribute("aab101");
String aab102=(String)session.getAttribute("aab102");
String aab108=(String)session.getAttribute("aab108");
String aab109=(String)session.getAttribute("aab109");
String path=request.getContextPath();
%>
<div id="nav" >
	
		    <form action="<%=path%>/queryBet.html" method="post">			
			<input type="hidden" name="aab101" value="<%=aab101%>">
			<button style="submit" class="btn btn-light" formaction="<%=path%>/mainPage.jsp">��ҳ</button>
		    <button style="submit" class="btn btn-light" >����</button>
		    <button style="submit" class="btn btn-light"formaction="<%=path%>/queryArticle.html">����</button>
		    <button style="submit" class="btn btn-light"formaction="<%=path%>/queryAcc.html">��Ʒ</button>

	         <c:if test="${aab108==2}">
	            <button style="submit" class="btn btn-light" formaction="<%=path%>/adminGo.jsp">��վ����</button>
		   </c:if>
 		<button style="submit" class="btn btn-light" formaction="<%=path%>/forum.html">��̳</button>

		    </form>
	
	
		    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:15;right:0;width:300;height:10;z-index:1;visibility:visible;"> 
			<span id="menubar" style="width:300" > 
				<font color=red size=2>
				   <c:if test="${aab108==2}">����Ա  <%=aab102%></c:if>
			 	   <c:if test="${aab108==1}">�û�  <%=aab102%></c:if>
				   <c:if test="${aab108==null}">�ο�</c:if>		 
				</font>
			</span> 
			<!--ʵ�������ͣ���ֲ˵�  -->
				<div id="menu" style="position:absolute;top:15;right:0;width:300;height:10;z-index:2;visibility:hidden;"> 
					
					<form action ="<%=path%>/queryPerson.html" method="post">
						<input type="hidden" name="aab101" value="<%=aab101%>">
						<input type="submit" name="toLog" formaction="<%=path%>/login.jsp" value="��¼��ע��"><BR>
						 <c:if test="${aab108!=null}">
						 		<input type="submit"  name="toQpi" formnovalidate="formnovalidate" value="������Ϣ">
						</c:if>
					  	 <c:if test="${aab108==null}">
			       				<input type="submit" name="psgToLog" value="������Ϣ" formaction="<%=path%>/login.jsp">
			     	     </c:if>
					</form>

				</div> 
			</div> 
</div>
aab101=<%=aab101%>
<br>
aab108=<%=aab108%>
	<SCRIPT language=javascript>
	
		function out1() 
		{ 
			if(window.event.toElement.id!="menu1" && window.event.toElement.id!="link") 
			menu1.style.visibility="hidden"; 
		} 
	</SCRIPT> 