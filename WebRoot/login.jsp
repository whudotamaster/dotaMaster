<%@ page language="java"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
<title>��¼</title>
</head>
<body  class="text-center">

${msg }
<div id="login" >
	<form action="<%=path%>/login.html" method="post" class="form-signin">
		<table>
		    <h1 class="h3 mb-3 font-weight-normal">��¼/ע��</h1>
			
			<tr>
				<td>�˺�</td>
				<td>
					<e:text name="aab103" required="true" autofocus="true"/> 
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<input type="password" name="aab104" required="true"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input   class="btn btn-lg btn-primary btn-block" type="submit" name="next" value="��¼">
					<input  class="btn btn-lg btn-primary btn-block"  type="submit" name="next" formaction="<%=path%>/logon.html" 
					value="ע��" formnovalidate="formnovalidate">
				</td>			
			</tr>
		</table>

</div>
</body>
</html>



