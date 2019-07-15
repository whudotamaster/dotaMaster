<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
tr {
	height: 25px;
}

.round_icon {
	width: 34px;
	height: 34px;
	display: flex;
	border-radius: 50%;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}
</style>

</head>
<body >
	<%@ include file="header.jsp" %>
	${msg }
	<br>
	<%=session.getId() %>
	<br>
	<form id="myform" action="<%=path%>/forum.html" method="post">
		<!-- ��ѯ������ -->
		<table border="1" width="95%" align="center">
			<caption>
				�ղ�ҳ��
				<hr width="160">
			</caption>
		</table>
		<!-- ���ݵ����� -->
		<table border="1" width="95%" align="center">
			<tr>
				<td></td>
				<td>������</td>
				<td>�ظ���</td>
				<td>�ղ�ʱ��</td>
				<td></td>
			</tr>
			<!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
			<c:choose>
				<c:when test="${rows!=null }">
					<!-- ��ʾʵ�ʲ�ѯ�������� -->
					<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							<td><input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
								</td>
								<td>
							<!-- #  ��ê --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<td><a href="#" onclick="onDel('${ins.aab501}')">ɾ��</a></td>
						</tr>
					</c:forEach>
					<!-- ������� -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="1" step="1" end="15">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- ���ܰ�ť�� -->
		<table border="1" width="95%" align="center">
			<tr>
				<td align="center">
				<input type="submit"
					id="delPost" name="next" value="ɾ���ղ�" 
					disabled="disabled"
					formaction="<%=path%>/delHistory.html">
				  <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
					</td>
			</tr>
		</table>
		 <e:hidden name="aab101" defval="<%=aab101 %>"/>
	</form>
		<%@ include file="footer.jsp" %>
</body>

<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("delPost");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delHistoryById.html?aab501=" + vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</html>