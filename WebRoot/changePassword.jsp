<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>修改个人信息</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<br>
${msg }
<form  method="post" action="<%=path%>/updtPsnPwd.html" name="myform" >
<table border="1" align="center" width="45%">

  <caption>
       个人信息修改action="<%=path%>/updtPsnPwd.html"<hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${ins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>请输入原密码</td>
	 	<td>
	 	<input type="password" id="oaab104" name="oaab104" required="required"/>	    
	 	</td>
	 </tr>	 
	  <tr>
	 	<td>请输入新密码</td>
	 	<td>
	 	<input type="password" id="naab104" name="naab104" required="required"/>
	 	</td>
	 </tr>	
	 <tr>
	 	<td>请确认新密码</td>
	 	<td>
 		 	<input type="password" id="maab104" name="maab104" required="required"/>
	 	</td>
	 </tr>
</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
 <input type="submit" name="next"   onclick="onCompare()"  value="确认修改">
 <input type="submit" name="Submit" formaction="<%=path%>/updtPsnInf.html"   formnovalidate="formnovalidate" value="放弃修改">
</form>
	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
<script type="text/javascript">
function onCompare()
{
	 var vform = document.getElementById("myform");
	 var o = document.getElementById("oaab104").value; 
	 var m = document.getElementById("maab104").value;
	 var n = document.getElementById("naab104").value;
	 if(m==n&&m!=null&&o!=m)
		 {
		 vform.action="<%=path%>/updtPsnPwd.html";
    	 vform.submit();
		 }
	 else
		 {
		 alert("确认密码失败！请重新输入");
		 }
}


</script>
</html>