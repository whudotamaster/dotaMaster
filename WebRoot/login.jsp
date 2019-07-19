<%@ page language="java"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
     <link href="css/style.css" rel="stylesheet">
<title>µÇÂ¼</title>
</head>
<style type="text/css">
.bg{
			animation: bgAnimate 15s ease infinite;
			
		}
		@keyframes bgAnimate {
			0%{
				background: url("images/1563522428627.jpg") no-repeat;
				background-size: 100%;
			}
			33%{
				background:url("images/1563522467238.jpg") no-repeat;
				background-size: 100%;
			}
			66%{
				background: url("images/156352282667.jpg") no-repeat;
				background-size: 100%;
			}
			100%{
				background: url("images/1563522428627.jpg") no-repeat;
				background-size: 100%;
			}
		}

</style>
<body  class="bg">

${msg }
  <div id="login" style="margin:0 auto; width=800px" >
	<form action="<%=path%>/login.html" method="post" class="form-signin">
		<table>
		    <h1 class="h3 mb-3 font-weight-normal"><font color="white">µÇÂ¼/×¢²á</font></h1>
			
			<tr>
				<td><font color="white">ÕËºÅ</font></td>
				<td>
					<e:text name="aab103" required="true" autofocus="true"/> 
				</td>
			</tr>
			<tr>
				<td><font color="white">ÃÜÂë</font></td>
				<td>
					<input type="password" name="aab104" required="true"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input   class="btn  btn-primary btn-block" type="submit" name="next" value="µÇÂ¼">
					<input  class="btn  btn-primary btn-block"  type="submit" name="next" formaction="<%=path%>/logon.html" 
					value="×¢²á" formnovalidate="formnovalidate">
				</td>			
			</tr>
		</table>

</div>

</body>
</html>



