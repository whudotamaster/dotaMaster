<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>�鿴ѡ����Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
</head>
<body onload="imgOnLoad('PlayerBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryPlayer.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:55%">
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>ѡ����</td>
	    <td>
	      <e:text name="qaac1002"/>
	    </td>
	  </tr>	 
	</table>
	<!-- ���ݵ����� -->
	<table align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:55%">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>ѡ��ͷ��</td>
	    <td>ѡ����</td>
	    <td></td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				    <c:if test="${aab108==2}">
				      <input type="checkbox" name="idlist" value="${ins.aac1001 }"
				             onclick="onSelect(this.checked)" >
				             </c:if>
				    </td>
				    <td>${vs.count }</td>
				     <td  >
				       <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:30%; height:100%">
				     </td>
				    <td>
				      <!-- #  ��ê -->
				     <a href="#" style="color:black" onclick="onEdit('${ins.aac1001}')">${ins.aac1002 }</a>
				    </td>
				     <c:if test="${aab108==2}">
				    <td>
				      <a href="#" style="color:black" onclick="onDel('${ins.aac1001}')">ɾ��</a>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="��ѯ">
	        <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addPlayer.jsp">
	       <input type="submit" class="btn btn-secondary  active" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delPlayer.html"  disabled="disabled">
	       </c:if>
	        <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
		    <input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
			<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
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
      
      function onEdit(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>