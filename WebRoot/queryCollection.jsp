<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath();
String aab101=(String)session.getAttribute("aab101");
%>
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

<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("delCollection");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDelCollection(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delCollectionByIdInQueryCollection.html?aab501="+vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body >
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
				<td>������</td>
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
								value="${ins.aab701 }" onclick="onSelect(this.checked)">
								</td>
								<td>
							<!-- #  ��ê --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>
								<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
							</td>
							<td>${ins.aab702 }</td>
							<td><a href="#" onclick="onDelCollection('${ins.aab501}')">ɾ��</a></td>
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
					id="delCollection" name="next" value="ɾ���ղ�" 
					disabled="disabled"
					formaction="<%=path%>/delCollection.html">
				  <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
					</td>
			</tr>
		</table>
		 <e:hidden name="aab101" defval="<%=aab101 %>"/>
	</form>
</body>
</html>