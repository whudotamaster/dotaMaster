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
<form id="myform" action="<%=path%>/queryChangelog.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="35%" align="center">
	  <caption>
	                ������־
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>���°汾��</td>
	    <td>
	      <e:text name="qaac1202"/>
	    </td>
	  </tr>	 
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>���°汾��</td>
	    <td>����ʱ��</td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac1201 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  ��ê -->
				     <a href="#" onclick="onEdit('${ins.aac1201}')">${ins.aac1202 }</a>
				    </td>
				     <td>${ins.aac1204 }</td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
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
	             
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=path%>/addChangelog.jsp">
	       </c:if>
	    </td>
	  </tr>
	</table>
</form>
</body>
<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaac1201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdChangelog.html?aac1201="+vaac1201;
    	 //alert(vform.action);
    	 vform.submit();
      }   
  
   </script>  
</html>