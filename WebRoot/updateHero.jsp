<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
td {
	height: 50px;
}
.container
{
	width:100%;
}

msg {
	color: #FF0000
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="demo" style="opacity: 0.9"></div>
	${msg}
	<br>
	<br>
	<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
		<table align="center" border="1" style="background-color:#FFFFFF;opacity: 0.9;width:55%">
		  <tr>
			<td>
			<font color="#000000" size="5px">Ӣ����ϸ��Ϣ���</font>
			</td>
			
			</tr>
			<tr>
				<td colspan="2">Ӣ��</td>
			</tr>
			<tr>
				<td>Ӣ��ͼ��</td>
				<td><img alt="no image" src=<%=path%>/images/${ins.aac112 } style="width: 12%; height: 100%">
				</td>
			</tr>
			<tr>
				<td>Ӣ����</td>
				<td><e:text name="aac102" readonly="readonly" required="true"
						defval="${ins.aac102 }" /></td>
			</tr>
			<tr>
			<tr>
			<td></td>
			</tr>
			<tr>
				<td colspan="2">����</td>
			</tr>
			<c:choose>
				<c:when test="${ins.rows2!=null }">
					<!-- ��ʾʵ�ʲ�ѯ�������� -->
					<c:forEach items="${ins.rows2 }" var="ins" varStatus="vs">
						<tr>
							<td>����ͼ��</td>
							<td><img alt="no image" src=<%=path%>/images/${ins.aac306 } style="width: 12%; height: 100%">
							</td>
						</tr>
						<tr>
							<td>������</td>
							<td><e:text name="aac302" readonly="readonly"
									defval="${ins.aac302 }" /></td>
						</tr>
						<tr>
							<td>��������</td>
							<td><e:textarea rows="5" cols="70" name="aac303" readonly="readonly"
									defval="${ins.aac303 }" /></td>
						</tr>
						<tr>
							<td>��ȴ</td>
							<td><e:text name="aac304" readonly="readonly"
									defval="${ins.aac304 }" /></td>
						</tr>
						<tr>
							<td>����</td>
							<td><e:text name="aac305" readonly="readonly"
									defval="${ins.aac305 }" /></td>
						</tr>
						<tr>
						<td></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			<tr>
				<td colspan="2">�츳</td>
			</tr>
			<c:choose>
				<c:when test="${ins.rows!=null }">
					<!-- ��ʾʵ�ʲ�ѯ�������� -->
					<c:forEach items="${ins.rows }" var="ins" varStatus="vs">
						<tr>
							<td>�츳�ȼ�</td>

							<td><e:text name="aac202" readonly="readonly"
									defval="${ins.aac202 }" /></td>
						</tr>
						<tr>
							<td>�츳����</td>
							<td><e:textarea rows="1" cols="70" name="aac203" readonly="readonly"
									defval="${ins.aac203 }" /></td>
						</tr>
						
						<tr>
						<td></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>

			<tr>
				<td align="center">
				<input type="submit" name="next" class="btn btn-secondary  active"
					value="�޸�" formaction="<%=path%>/updateHeroMore.html"
					formnovalidate="formnovalidate">
				<input type="submit" name="next" class="btn btn-secondary  active"
					value="����" formaction="<%=path%>/queryHero.html"
					formnovalidate="formnovalidate">
				</td>
			     
			</tr>
		</table>
		<input type="hidden" name="aac901" value="${param.aac101 }">
	</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    
      function onEdit(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>
</html>