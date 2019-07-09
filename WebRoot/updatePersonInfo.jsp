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
	 </tr>
	
</table>
 <input type="submit" name="next" formaction="<%=path%>/updtPsnInf.html" value="修改">
 <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回上一页">

	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
</html>