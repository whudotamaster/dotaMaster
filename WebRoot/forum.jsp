<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
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
    	  var vdel=document.getElementById("goodPost");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501,vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501 + "&aab101=" + vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab501,vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delPost.html?aab501=" + vaab501 + "&aab101=" + vaab101;
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
				��̳��ҳ
				<hr width="160">
			</caption>
			<tr>
				<td colspan="4">��ѯ����</td>
			</tr>
			<tr>
				<td>��ǩ����</td>
				<td><e:text name="aab502" /></td>
			</tr>
			<tr>
				<td>����</td>
				<td><e:radio name="aab506" value="��ͨ��:0,������:1" defval="0" /></td>
				<td>
				<c:if test="${empty param.aab101 }">
				param.aab101�ǿ�
				</c:if>
				</td>
				<c:if test="${!empty param.aab101 }">
					<td>����</td>
					<td>		
					<input type="submit"
					id="addPost" name="next" value="����" formaction="<%=path%>/addPost.html?aab101=${ param.aab101 }">
					</td>
				</c:if>
				
			</tr>

		</table>
		<!-- ���ݵ����� -->
		<table border="1" width="95%" align="center">
			<tr>
				<td></td>
				<td>������</td>
				<td>������</td>
				<td>¥����</td>
				<td>ʱ��</td>
				<td></td>
			</tr>
			<!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,���������ֿո�
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
							<!-- #  ��ê --> <a href="#" onclick="onVisit('${ins.aab501 }' , '${param.aab101 }')">	${ins.aab502 }</a>
						
							</td>
							<td>
								<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<td><a href="#" onclick="onDel('${ins.aab501}' , '${param.aab101 }')">ɾ��</a></td>
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
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- ���ܰ�ť�� -->
		<table border="1" width="95%" align="center">
			<tr>
				<td align="center"><input type="submit" name="next" value="��ѯ">
					<input type="submit" name="next" value="����"
					formaction="<%=path%>/addEmp.jsp"> 
					<input type="submit"
					id="goodPost" name="next" value="�Ӿ�" formaction="<%=path%>/goodPost.html?aab101=${param.aab101 }"
					disabled="disabled"></td>
			</tr>
		</table>
	</form>
</body>
</html>