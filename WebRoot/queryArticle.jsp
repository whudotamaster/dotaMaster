<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>��ѯ����</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
   

</head>
<body onload="imgOnLoad('ta','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<!-- ����ͷ�������� -->
<br>
<br>
<form id="myform" action="<%=path%>/queryArticle.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#CCDDFF;opacity: 0.9;width:85%">
	  
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>������</td>
	    <td>
	      <e:text name="qaab802"/>
	    </td>
	</table>
	<!-- ���ݵ����� -->
	<table align="center" class="table table-striped" style="background-color:#CCDDFF;opacity: 0.9;width:85%">
	  <tr>
	  
	    <td>���</td>
	    <td>���±���</td>
	    <td>�û�</td>
	    <td>����ʱ��</td>
	
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  ��ê -->
				      <a style="color:#D5A5D9" href="#" onclick="onEdit('${ins.aab801}')">${ins.aab802 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab805 }</td>
				 
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
			          <tr>
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
	                   
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="0" cellpadding="0" cellspacing="0"  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="���²�ѯ">
	       
	        <c:if test="${aab108!=null}">
	       		<input type="submit" class="btn btn-secondary  active" name="next" value="��ҪͶ��" 
	              formaction="<%=path%>/addArticle.jsp">
	     	</c:if>
	     	 <c:if test="${aab108==null}">
	       		<input type="submit" class="btn btn-secondary  active" name="next" value="��ҪͶ��" 
	              formaction="<%=path%>/login.jsp">
	     	</c:if>
	             <c:if test="${aab108==2}">
					<input type="submit" onclick="back()"  class="btn btn-secondary  active" formaction="<%=path%>/adminQueryArticle.html" value="���">
	        	</c:if>
	        <input type="button" onclick="onBack()" class="btn btn-secondary  active" id="backFloor" value="��һҳ">
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
      
      function onEdit(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdArticle.html?aab801="+vaab801;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdArticle.html?aab801="+vaab801;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>