<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��������</title>
</head>
<body>
${msg }
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<c:if test="${aab108==2}">
<form id="myform" action="<%=path%>/adminQueryComp.html" method="post">
  <!-- ��ѯ������ -->

      <center>����������</center>
	    <hr width="160">
	 

	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>���±���</td>
	    <td>�û�</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aab801 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aab801}')">${ins.aab802 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab805 }</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aab801}')">ɾ��</a>
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
	    <td align="center">
	         <input type="submit" id="ref" name="next" value="ˢ��" 
	              formaction="<%=path%>/adminQueryComplain.html">     
	            <input type="submit" id="del" name="next" value="����" 
	              formaction="<%=path%>/mainPage.html">        
	    </td>
	  </tr>
	</table>
</form>
</c:if>

<%@include file="footer.jsp" %>
<!-- ����ҳ�� -->
</body>
</html>