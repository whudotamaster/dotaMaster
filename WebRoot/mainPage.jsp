<%@ page language="java" 
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<style>
.foot{position:fixed; bottom:0; 
}
.main{min-height: 700px;}


</style>
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<div id="main">
</div>
<%@include file="footer.jsp" %>
<!-- 引入页脚 -->
${msgs}
</body>
</html>