<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="header.jsp" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:40px;
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
<div class="demoDOTA2"></div>
<form id="myform" method="post">
	<!-- ���ݵ����� -->
	
	<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:90%">
	   <caption align="left"><font color="white" size="5px"><%=aab108.equals("1")?"�鿴��ʷ����":"�鿴�������б�"%></font> </caption>
	  <tr>
	    <td>���</td>
	    <td>��Ʒ����</td>
	    <td>�۸�</td>
	    <td>��ұ��</td>
	    <td>����ʱ��</td>
	    <td>����</td>
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
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aad401 }')">${vs.count }</a>
				    </td>
				    <td>${ins.aac602 }</td>
				    <td>${ins.aac605 }</td>
				    <td>${ins.aad402 }</td>
				    <td>${ins.aad405 }</td>
					<td>${ins.aad404 }</td>
				    <td>${ins.fvalue }</td>
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
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="<%=aab108.equals("1")?"�鿴��ʷ����":"�鿴�������б�"%>"
              formaction="<%=path%>/<%=aab108.equals("1")?"queryBuyOrder.html":"querySendAcc.html"%>">
               <input type="submit" class="btn btn-secondary  active" formaction="<%=path%>/mainPage.jsp" value="����">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="1">
</form>
</body>
</html>