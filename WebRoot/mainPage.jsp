<%@ page language="java" 
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
<%
	String laab102=(String)request.getAttribute("ins.aab102");
%>

</script>

<html>
<head>
<title>��ҳ</title>
<style>
.foot{position:fixed; bottom:0; 
}
.main{min-height: 700px;}


</style>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<div id="main">

 
 <form>
 ${ins[0].aab102 }
 </form>

</div>
<%@include file="footer.jsp" %>
<!-- ����ҳ�� -->

</body>
</html>