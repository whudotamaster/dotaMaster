<%@ page language="java"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<link rel="shortcut icon" href="ico/favicon.ico" />
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
     <link href="css/style.css" rel="stylesheet">
<title>欢迎来到DotaMaster</title>
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
<body  class="bg" onload="u()">


  <div id="login" style="margin:0 auto; width=800px" >
	<form id="myform" action="<%=path%>/login.html" method="post" class="form-signin">
		<table>
		    <h1 class="h3 mb-3 font-weight-normal"><font color="white">登录/注册</font></h1>
			
			<tr>
				<td><font color="white">账号</font></td>
				<td>
					<e:text name="aab103" required="true" autofocus="true"/> 
				</td>
			</tr>
			<tr>
				<td><font color="white">密码</font></td>
				<td>
					<input type="password" name="aab104" required="true"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input   class="btn  btn-primary btn-block" type="submit" name="next" value="登录">
					<input  class="btn  btn-primary btn-block" type="submit" name="next" formaction="<%=path%>/logon.html" 
					value="注册" >
				</td>			
			</tr>
		</table>

</div>

</body>

<script>
function u()
{
	if(${msg=="提示：登陆失败！"})
		{
		alert("登陆失败，账号密码错误");
		}
	
	if(${msg=="	输入的用户名过长，最多可输入15位"})
	{
	alert("注册失败：输入用户名过长");
	}
	if(${msg=="	注册失败，用户名重复！"})
	{
	alert("注册失败，用户名重复");
	}
	}

</script>
</html>



