<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); 
String aab108=(String)session.getAttribute("aab108");%>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   
   <script type="text/javascript">    
      function onEdit(vaad401)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findSendAcc.html?aad401="+vaad401;
    	 vform.submit();
      }

   </script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" method="post">
	<!-- ���ݵ����� -->
	
	<table border="1" width="95%" align="center">
	 <caption>
	       <%=aab108.equals("1")?"�鿴��ʷ����":"�鿴�������б�"%>
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>���</td>
	    <td>��Ʒ����</td>
	    <td>�۸�</td>
	    <td>��ұ��</td>
	    <td>����ʱ��</td>
	    <td>����</td>
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
				      <a href="#" onclick="onEdit('${ins.aad401 }')">${vs.count }</a>
				    </td>
				    <td>${ins.aac602 }</td>
				    <td>${ins.aac605 }</td>
				    <td>${ins.aad402 }</td>
				    <td>${ins.aad405 }</td>
				    <td>${ins.aad404 }</td>
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
	       <input type="submit" name="next" value="<%=aab108.equals("1")?"�鿴��ʷ����":"�鿴�������б�"%>"
              formaction="<%=path%>/<%=aab108.equals("1")?"queryBuyOrder.html":"querySendAcc.html"%>">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="1">
</form>
</body>
</html>