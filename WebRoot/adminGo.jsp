<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����</title>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<dev align="center" name="main">
<form method="post">
<ul>
<li><a href="adminQueryArticle.html">�������</a></li>
<li><a href="forum.html">��������</a></li>
<li><a href="adminQueryComp.html">��������</a></li>
<li><a href="querySendAcc.html">��������</a></li>
<li><a href="queryGetAcc.html">�ջ�����</a></li>
<li><a href="announceResult.jsp">�����������</a></li>
</ul>
	            <input type="submit" formaction="<%=path%>/mainPage.jsp" value="����">



</form>
</dev>
<%@include file="footer.jsp" %>
<!-- ����ҳ�� -->

</body>
</html>