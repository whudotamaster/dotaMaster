<%@ page language="java" 
    pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String laab102=(String)request.getAttribute("ins.aab102");
%>

<html>
<head>
	<title>Ö÷Ò³</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
</head>
<%@ include file="header.jsp" %>
<style type="text/css">
.bg{
			animation: bgAnimate 8s ease infinite;
			
		}
		@keyframes bgAnimate {
			0%{
				background: url("images/picture1.png") no-repeat;
				background-size: 100%;
			}
			50%{
				background:url("images/picture2.png") no-repeat;
				background-size: 100%;
			}
			100%{
				background: url("images/picture1.png") no-repeat;
				background-size: 100%;
			}
		}

/* body{
    font-size: 18px;
}
div>p{
    margin-left:155px;
}
@font-face {
    font-family: mySweet;
    src: url("font/tiantian.ttf")
}

.sweet{
    font-family: mySweet;
    color:#FF891F;
} */

</style>
<body style="height:100%">



<div class="bg" style="height:80%">



</div>

<!-- ÒýÈëÒ³½Å -->
<%@ include file="footer.jsp" %>
</body>

</html>





