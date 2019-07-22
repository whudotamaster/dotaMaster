<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>�鿴������Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="demoMatch" style="opacity: 0.9"></div>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryMatch.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:85%">
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
	<table align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:85%">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>������</td>
	    <td>������ʼʱ��</td>
	    <td>ս��1����</td>
	    <td>ս��2����</td>
	   
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac1101 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>
				      <!-- #  ��ê -->
				     <a href="#" onclick="onEdit('${ins.aac1101}')">${ins.aac1102 }</a>
				    </td>
				     <td>${ins.aac1103 }</td>
				     <td>${ins.aac1104 }</td>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" class="btn btn-secondary  active" onclick="back()" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addMatch.jsp">
	       </c:if>
	        <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
			<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
			<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
			<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
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