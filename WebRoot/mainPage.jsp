
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
	<title>寮女</title>

</head>




<body>
<div class="demoLina" style="opacity: 0.9"></div>
<%@ include file="header.jsp" %>

<div id="main">

 <%=aab101%>


</div>
<%@include file="footer.jsp" %>


</body>

</html>
