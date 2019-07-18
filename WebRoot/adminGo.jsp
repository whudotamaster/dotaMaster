<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理岛</title>
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<dev align="center" name="main">
<form method="post">
<ul>
<li><a href="adminQueryArticle.html">审核文章</a></li>
<li><a href="forum.html">管理帖子</a></li>
<li><a href="adminQueryComp.html">处理申诉</a></li>
<li><a href="querySendAcc.html">发货处理</a></li>
<li><a href="queryGetAcc.html">收货处理</a></li>
<li><a href="announceResult.jsp">公布比赛结果</a></li>
</ul>
	            <input type="submit" formaction="<%=path%>/mainPage.jsp" value="返回">



</form>
</dev>
<%@include file="footer.jsp" %>
<!-- 引入页脚 -->

</body>
</html>