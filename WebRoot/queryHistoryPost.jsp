<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>��ʷ����</title>
<link rel="shortcut icon" href="ico/favicon.ico" />

<style type="text/css">
tr {
	height: 40px;
}

#a td {
style=text-align:left;
vertical-align:middle;
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

 body
  {
  color:black;
  }
         .posthidden{
		white-space:nowrap;
		overflow:hidden; 
		text-overflow:ellipsis;
		color:#000000;
		}
</style>

</head>
<body onload="imgOnLoad('hc','png');pageOnLoad()">
	<%@ include file="header.jsp" %>
	<br>
	<br>
	<form id="myform" action="<%=path%>/queryHistoryById.html" method="post">
		<!-- ��ѯ������ -->
		<!-- ���ݵ����� -->
		<table align="center" class="table table-striped" id="a" style="background-color:#8eb0cc;opacity: 0.9;width:80%">
			<tr>
				<td></td>
				<td>������</td>
				<td>�ظ���</td>
				<td>����ʱ��</td>
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
					<c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
						<tr>
							<td><input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
								</td>
								<td width="50%">
							<!-- #  ��ê --> 
								<div class="posthidden" style="width:80%">
							<a href="#" onclick="onVisit('${ins.aab501 }')"  style="color:#000000;text-decoration:underline">${ins.aab502 }</a>
							</div>
							</td>
							<td width="15%">${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<td><a href="#" onclick="onDel('${ins.aab501}')"  style="color:#000000;text-decoration:underline">ɾ��</a></td>
						</tr>
					</c:forEach>
					<!-- ������� -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
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
					<c:forEach begin="1" step="1" end="11">
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
		<table width="95%" align="center">
			<tr>
				<td align="center">
				<input type="submit" class="btn btn-secondary  active"
					id="delPost" name="next" value="ɾ������" 
					disabled="disabled"
					formaction="<%=path%>/delHistory.html">
				  <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
              	<input type="button" class="btn btn-secondary  active" onclick="historyPage();onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="historyPage();onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
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
      
      function historyPage() 
      {
    	  var vform = document.getElementById("myform");
     	 vform.action="<%=path%>/queryCollection.html;
		}
   </script>
</html>