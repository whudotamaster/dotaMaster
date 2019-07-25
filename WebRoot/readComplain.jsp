<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>投诉详细内容</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />

<style type="text/css">
td {
	height: 30px;
}

msg {
	color: #FF0000
}
</style>
</head>
<body onload="imgOnLoad('dota2','png');pageOnLoad()">
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

	<!-- 引入头部导航栏 -->

	<br>
	<br>
	<form method="post">
		<table  align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:45%">
			<caption>
				投诉详细内容
				<hr width="160">
			</caption>
			<tr>
				<td colspan="2">投诉</td>
			</tr>
			<tr>
				<td>投诉标题</td>
				<td><e:text name="aad502" required="true" readonly="true"
						defval="${ins.aad502 }" /></td>
			</tr>
			<tr>
				<td>投诉用户</td>
				<td><e:text name="aab102" required="true" readonly="true"
						defval="${ins.aab102 }" /></td>
			</tr>

			<tr>
				<td>投诉时间</td>
				<td><e:text name="aad505" required="true" readonly="true"
						defval="${ins.aad505 }" /></td>
			</tr>



			<tr>
				<td>投诉详细内容</td>
				<td><e:textarea rows="5" cols="45" name="aad503"
						readonly="true" defval="${ins.aad503 }" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><c:if test="${aab108!=2}">
						<input type="submit" name="next" value="返回"
							formaction="<%=path%>/queryArticle.html"
							formnovalidate="formnovalidate">
					</c:if> <!-- 管理员可见的两个按钮 --> <c:if test="${aab108==2}">
						<input type="submit" name="next" value="返回"
							formaction="<%=path%>/adminQueryComp.html"
							formnovalidate="formnovalidate">
						<input type="submit" name="done" value="已经处理"
							formaction="<%=path%>/doneByIdComplain.html"
							formnovalidate="formnovalidate">
						<input type="submit" name="undone" value="无法处理"
							formaction="<%=path%>/undoneByIdComplain.html"
							formnovalidate="formnovalidate">
					</c:if></td>
			</tr>

		</table>
		<input type="hidden" name="aad501" value="${ins.aad501 }">

	</form>
	<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>