<%@ page language="java"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>��¼</title>
</head>
<body>
${msg }
	<form action="<%=path%>/login.html" method="post">
		<table  border="1" align="center" width="30%">
			<caption>
			�û���¼/ע��
			</caption>
			<tr>
				<td>�˺�</td>
				<td>
					<e:text name="aab103" required="true" autofocus="true"/> 
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<e:text name="aab104" required="true"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="next" value="��¼">
					<input type="submit" name="next" formaction="<%=path%>/logon.html" 
					value="ע��" formnovalidate="formnovalidate">
				</td>			
			</tr>
		</table>
	</form>

</body>
</html>