<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
<style>
tr {
	height: 25px;
}
</style>
<title>�鿴${qins.aab102}����Ϣ</title>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<br>
<form action="<%=path%>/updtPsnInf.html" method="post" id="myform">
<table border="1" align="center" width="45%">
  <caption>

       �޸��ҵ���Ϣ
  
 
       <hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${qins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>�ǳ�</td>
	 	<td>
	 	   <e:text name="aab102" required="true" autofocus="true" readonly="true" defval="${qins.aab102 }" /> 
	 	</td>
	 </tr>
	  <tr>
	 	<td>ͷ��</td>
	 	<td>
 	      <img id="avatar" src="/Avatar/${qins.aab105 }" style="height:200px;width:200px;" >
 	  	</td>
		</tr>
	 <tr>
	 
	 <td>��ǰ����ֵ</td>
	 	<td>
 	       <e:text name="aab107" required="true" readonly="true" defval="${qins.aab107 }"/> 
	 	</td>
	 </tr>
</table>
<!-- ���ݵ����� -->
		<table border="1" width="95%" align="center">
			<tr>
				
				<td>������</td>
				<td>�ظ���</td>
				<td>����ʱ��</td>
		
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
							
								<td>
							<!-- #  ��ê --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							
						</tr>
					</c:forEach>
					<!-- ������� -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
						<tr>
						
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
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>









 <input type="submit" name="Submit" formaction="<%=path%>/forum.html"  formnovalidate="formnovalidate" onclick="back()" value="������̳">

 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="������ҳ">
</form>

	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
</body>
    <script>
    function onVisit(vaab501)
    {
  	 
  		 var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
      	 //alert(vform.action);
      	 vform.submit();
  	
    }
    </script>
</html>