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
${msg }
<%@ include file="header.jsp" %>
<div class="demoEquipment" style="opacity: 0.9"></div>
<br>
<br>
<form id="myform" action="<%=path%>/queryEquipment.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#C0C2B8;opacity: 0.9;width:55%">
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>װ����</td>
	    <td>
	      <e:text name="qaac502"/>
	    </td>
	  </tr>
	</table>
	<!-- ���ݵ����� -->
	<table align="center" class="table table-striped" style="background-color:#C0C2B8;opacity: 0.9;width:55%">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>װ��ͼ��</td>
	    <td>װ����</td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac501 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac505 } style="width:70%; height:100%">
				     </td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" style="color:#2C2B2A" onclick="onEdit('${ins.aac501}')">${ins.aac502 }</a>
				    </td>
				    <c:if test="${aab108==2}">
				    <td>
				      <a href="#" style="color:#2C2B2A" onclick="onDel('${ins.aac501}')">ɾ��</a>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table  border="0" cellpadding="0" cellspacing="0"  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addEquipment.jsp">
	       <input type="submit" id="del" class="btn btn-secondary  active"  name="next" value="ɾ��" 
	              formaction="<%=path%>/delEquipment.html"  disabled="disabled">
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
      
      function onEdit(vaac501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEquipment.html?aac501="+vaac501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaac501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdEquipment.html?aac501="+vaac501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>