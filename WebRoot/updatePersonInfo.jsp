<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>修改个人信息</title>
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<br>
<form action="<%=path%>/updtPsnInf.html" method="post">
<table border="1" align="center" width="45%">
  <caption>
       个人信息修改<hr width="160">
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
 	       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }"/> 
	 	</td>
	 </tr>
	 <tr>
	 	<td>密码</td>
	 	<td>
 	       <e:text name="aab104" required="true" defval="${ins.aab104 }"/> 
	 	</td>
	 </tr>
	  <tr>
	 	<td>头像</td>
	 	<td>
 	       <e:text name="aab105" defval="${ins.aab105 }"/> 
	 	</td>

</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
	
 <input type="submit" name="next"  value="修改">
 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="返回主页">
</form>
	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
</html>