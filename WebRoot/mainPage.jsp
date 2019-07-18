
<%@ page language="java" 
    pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String laab102=(String)request.getAttribute("ins.aab102");
%>
<script>
//登陆刷新页面
function refresh(){
    url = location.href;
 console.log(url);
    var once = url.split("#");
    if (once[1] != 1) {
        url += "#1";
        self.location.replace(url);
       window.location.reload();
    }
}
 
setTimeout('refresh()', 1);
  
</script>

<html>
<head>
	<title>主页</title>

</head>




<body>
<div class="demoLina" style="opacity: 0.9"></div>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<div id="main">

 <%=aab101%>
啥也没.jpg


</div>
<%@include file="footer.jsp" %>
<!-- 引入页脚 -->

</body>

</html>
