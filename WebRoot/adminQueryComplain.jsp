<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��������</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
tr {
	height: 25px;
}
}
</style>
</head>

<body onload="imgOnLoad('dota2','png');pageOnLoad()">

<%@ include file="header.jsp" %>

<font color="white">

</font>
<br>
<br>

		<form id="myform" action="<%=path%>/adminQueryComp.html" method="post">	<!-- ���ݵ����� -->
	
	<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:90%">
	   <caption align="left"><font color="white" size="5px">����������</font> </caption>
		<tr>
			<td>���</td>
			<td>Ͷ�߱���</td>
			<td>Ͷ���û�</td>
			<td>Ͷ������</td>
			<td>�ύʱ��</td>
			<td colspan="2">�������</td>
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
						<c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="15">
							<tr>

								<td>${vs.count + (rows[0].nowFloor-1)*15}</td>
								<td><a href="#" onclick="onEdit('${ins.aad501}')">${ins.aad502}</a>
								</td>
								<td>${ins.aab102 }</td>
								<td>${ins.aad503 }</td>
								<td>${ins.aad505 }</td>
								<td><a href="#" onclick="onDone('${ins.aad501}')">�������</a>
								</td>
								<td><a href="#" onclick="onUndone('${ins.aad501}')">�޷�����</a>
								</td>

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
								<td></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	   <div align="center">
					<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
					</div>
	<input type="hidden" name="aab101" value="${aab101} ">
</form>
<%@include file="footer.jsp" %>

</body>
<script type="text/javascript">
      var count=0;      
      function onEdit(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      function onDone(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/doneByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      function onUndone(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/undoneByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      
   }
   </script>
</html>