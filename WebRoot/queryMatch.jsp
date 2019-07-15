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
<form id="myform" action="<%=path%>/queryMatch.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="35%" align="center">
	  <caption>
	                ������Ϣ
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
	    <td></td>
	    <td>���</td>
	    <td>������</td>
	    <td>������ʼʱ��</td>
	    <td>ս��1����</td>
	    <td>ս��2����</td>
	    <td></td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac1001 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>
				      <!-- #  ��ê -->
				     <a href="#" onclick="onEdit('${ins.aac1001}')">${ins.aac1102 }</a>
				    </td>
				     <td>${ins.aac1103 }</td>
				     <td>${ins.aac1104 }</td>
				     <c:if test="${aab108==2 }">
				    <td>
				      <a href="#" onclick="onModify('${ins.aac1001}')">�޸�</a>
				    </td>
				     </c:if>
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
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=path%>/addMatch.jsp">
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
      
      function onEdit(vaac1101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdMatch.html?aac1101="+vaac1101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onModify(vaac1101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdMatch2.html?aac1101="+vaac1101;
    	 //alert(vform.action);
    	 vform.submit();
      }    
  
   </script>  
</html>