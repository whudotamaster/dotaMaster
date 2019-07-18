<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
<title>修改我的信息</title>
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<br>
<form action="<%=path%>/updtPsnInf.html" method="post">
<table border="1" align="center" width="45%">
  <caption>
  <c:if test="${aab101==ins.aab101}">
       修改我的信息
       </c:if>
      <c:if test="${aab101!=ins.aab101}">
       查看${ins.aab102}的信息
       </c:if>
       <hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${ins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>昵称</td>
	 	<td>
	 	   <c:if test="${aab101!=ins.aab101}">
 	       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }" readonly="true"/> 
 	       </c:if>
 	       
 	       <c:if test="${aab101==ins.aab101}">
 	       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }" /> 
 	       </c:if>
	 	</td>
	 </tr>
	 <c:if test="${aab101==ins.aab101}">
	 <tr>
	 	<td>密码</td>
	 	<td>
 	      <a href="changePassword.jsp">点我修改密码</a>
	 	</td>
	 </tr>
	 </c:if>
	 
	  <tr>
	 	<td>头像</td>
	 	<td>
 	      <img id="avatar" src="/Avatar/${ins.aab105 }" style="height:200px;width:200px;" >
 	  	</td>
		</tr>
	 <tr>
	 
	 <td>当前经验值</td>
	 	<td>
 	       <e:text name="aab107" required="true" readonly="true" defval="${ins.aab107 }"/> 
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>当前余额</td>
	 	<td>
 	       <e:text name="aab106" required="true" readonly="true" defval="${ins.aab106 }"/> 
	 	</td>
	 </tr>
	 	 <tr>
	 	<td>VIP到期时间</td>
	 	<td>
 	       <e:text name="aab109" required="true" readonly="true" defval="${ins.aab109 }"/> 
	 	</td>
	 </tr>
</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
	
 <input type="submit" name="next"  value="修改">
 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="返回主页">
</form>
<form id="form1" action="<%=path%>/uploadUser.htm" method="post" enctype="multipart/form-data">
   <input  type="hidden" name="aab101" value="<%=aab101%>">
     
    <input type="file" name="file" id="file" >
    <input type="submit" name="next" id="file" value="上传头像">
</form>
	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
    <script>
    
        window.onload = function ()
        {
            document.querySelector("#file").onchange = function ()
            {
                var req = new XMLHttpRequest();
                var form = new FormData(document.getElementById("form1"));
//              form.append("file",document.querySelector("#file").files[0]);
                req.open("post", "${pageContext.request.contextPath}/upload", true);
                req.send(form);
                req.onload = function () 
                {
                    document.getElementById("img").src = "${pageContext.request.contextPath}/pic/" + req.responseText;
                }
            }
        }
       
    </script>
</html>