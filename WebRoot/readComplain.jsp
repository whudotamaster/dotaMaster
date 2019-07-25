<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Ͷ����ϸ����</title>
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
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

	<!-- ����ͷ�������� -->

	<br>
	<br>
	<form method="post">
		<table  align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:45%">
			<caption>
				Ͷ����ϸ����
				<hr width="160">
			</caption>
			<tr>
				<td colspan="2">Ͷ��</td>
			</tr>
			<tr>
				<td>Ͷ�߱���</td>
				<td><e:text name="aad502" required="true" readonly="true"
						defval="${ins.aad502 }" /></td>
			</tr>
			<tr>
				<td>Ͷ���û�</td>
				<td><e:text name="aab102" required="true" readonly="true"
						defval="${ins.aab102 }" /></td>
			</tr>

			<tr>
				<td>Ͷ��ʱ��</td>
				<td><e:text name="aad505" required="true" readonly="true"
						defval="${ins.aad505 }" /></td>
			</tr>



			<tr>
				<td>Ͷ����ϸ����</td>
				<td><e:textarea rows="5" cols="45" name="aad503"
						readonly="true" defval="${ins.aad503 }" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><c:if test="${aab108!=2}">
						<input type="submit" name="next" value="����"
							formaction="<%=path%>/queryArticle.html"
							formnovalidate="formnovalidate">
					</c:if> <!-- ����Ա�ɼ���������ť --> <c:if test="${aab108==2}">
						<input type="submit" name="next" value="����"
							formaction="<%=path%>/adminQueryComp.html"
							formnovalidate="formnovalidate">
						<input type="submit" name="done" value="�Ѿ�����"
							formaction="<%=path%>/doneByIdComplain.html"
							formnovalidate="formnovalidate">
						<input type="submit" name="undone" value="�޷�����"
							formaction="<%=path%>/undoneByIdComplain.html"
							formnovalidate="formnovalidate">
					</c:if></td>
			</tr>

		</table>
		<input type="hidden" name="aad501" value="${ins.aad501 }">

	</form>
	<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>