<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
   <title>���տ���ɵ�����</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   

</head>
<body>
${msg }
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<br>
    
<form id="myform" action="<%=path%>/queryMission.html" method="post">
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>��������</td>
	    <td>��������</td>
	    <td>��������</td>
	    <td>��������</td>
	    <td>���״̬</td>
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
	    	   	    <td>${vs.count }</td>
				    <td>${ins.aab902 }</td>
				    <td>${ins.aab903 }</td>
				    <td>${ins.aab904 }</td>
				    <td>${ins.aab905 }</td>
				      <td>
				      <c:if test="${ins.aab1002==0}"><font color="green">����ɣ�</font></c:if>
				       <c:if test="${ins.aab1002==1}"><font color="red">����ɣ�</font></c:if>
				      </td>
				   </tr>
		      </c:forEach>
		     
	     </c:when>
	   
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	
	
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="ˢ��">
	        <input type="submit" id="del" name="next" value="������ҳ" 
	              formaction="<%=path%>/mainPage.jsp">
	        
	    </td>
	  </tr>
	</table>
		<input type="hidden" name="aab101" value="<%=aab101%>">
</form>


<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>

</body>

</html>