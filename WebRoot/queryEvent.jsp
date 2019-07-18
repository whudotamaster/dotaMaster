<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
<%@ include file="header.jsp" %>
${msg }
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryEvent.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="35%" align="center">
	  <caption>
	            ������Ϣ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>������</td>
	    <td>
	      <e:text name="qaac702"/>
	    </td>
	  </tr>	 
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td>���</td>
	    <td>������</td>
	    <td>���¼���</td>
	    <td>�����ܽ���</td>
	    <td>���¿���ʱ��</td>
	    <td>���½���ʱ��</td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td style="width:15%; height:15%">${vs.count }</td>
				    <td align="center">
				      <!-- #  ��ê -->
				     <a  href="#" onclick="onEdit('${ins.aac701}')">${ins.aac702 }</a>
				    </td> 
				    <td>${ins.aac703 }</td>
				    <td>${ins.aac704 }</td>
				    <td>${ins.aac705 }</td>
				    <td>${ins.aac706 }</td>
				    <c:if test="${aab108==2}">  
				    <td>
				      <a href="#" onclick="onModify('${ins.aac701}')">�޸�</a>
				    </td>
				    </c:if>
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
			     <td></td>
			     <td></td>	                           
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" onclick="back()" value="��ѯ">
	        <c:if test="${aab108==2}">  
	       <input type="submit" name="next" value="���" 
	       formaction="<%=path%>/addEvent.jsp">   
	       </c:if>
	         <input type="button" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
</form>
</body>
<script type="text/javascript">
      function onEdit(vaac701)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEvent.html?aac701="+vaac701;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onModify(vaac701)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEvent2.html?aac701="+vaac701;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>