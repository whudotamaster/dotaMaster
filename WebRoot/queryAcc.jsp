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
        height:25px;
     }
   

   </style>


</head>
<body>
${msg }
<div class="demoAcc" style="opacity: 0.9"></div>
<br>
<br>
<form id="myform" action="<%=path%>/queryAcc.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#ABCDE7;opacity: 0.9;width:65%" >
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>��Ʒ��</td>
	    <td>
	      <e:text name="qaac602"/>
	    </td>
	  </tr>
	 

	</table>
	<!-- ���ݵ����� -->
	<table align="center" class="table table-striped" style="background-color:#ABCDE7;opacity: 0.9;width:65%" >
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>��Ʒͼ��</td>
	    <td>��Ʒ��</td>
	    <td></td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac601 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				     <td  style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:50%; height:100%">
				     </td>
				    <td>
				      <!-- #  ��ê -->			    		    
				      <a href="#" onclick="onEdit('${ins.aac601}')">${ins.aac602 }</a>
				    </td>
				    <c:if test="${aab108==2}">
				    <td>
				      <a href="#" onclick="onDel('${ins.aac601}')">ɾ��</a>
				    </td>
				    </c:if>
				    <c:if test="${aab108==1}">
				    <td>
				      <a href="#" onclick="onBuy('${ins.aac601}')">����</a>
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
	<table border="0" cellpadding="0" cellspacing="0" align="center" >
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" onclick="back()" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addAcc.jsp">
	              </c:if>
	       <c:if test="${aab108==2}">
	       		<input type="submit" id="del" class="btn btn-secondary  active"  name="next" value="ɾ��" 
	              formaction="<%=path%>/delAcc.html"  disabled="disabled">
	       </c:if>
	       <input type="submit" id="buy" class="btn btn-secondary  active" name="next" value="��������" 
	              formaction="<%=path%>/buyAccList.html"  disabled="disabled">

	       <input type="text" id="vaad402"  class="btn btn-secondary  active" name="aad402" placeholder="������ұ��" disabled="disabled">
	       <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" class="btn btn-secondary  active" id="nextFloor" value="��һҳ">
					<input hidden="true" type="text" name="nowFloor" class="btn btn-secondary  active" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aac901" value="${param.aac901 }">
	<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
</body>
<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  var vaad402=document.getElementById("vaad402");
    	  var vbuy=document.getElementById("buy");
    	  vaad402.disabled=(count==0);
    	  vbuy.disabled=(count==0);
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaac601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdAcc.html?aac601="+vaac601;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdAcc.html?aac601="+vaac601;
    	 //alert(vform.action);
    	 vform.submit();
      }    
      function onBuy(vaac601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/buyAcc.jsp?aac601="+vaac601;
    	 //alert(vform.action);
    	 vform.submit();
      } 
   </script>  
</html>