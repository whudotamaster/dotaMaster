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
      function onEdit(vaad301)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findGetAcc.html?aad301="+vaad301;
    	 //alert(vform.action);
    	 vform.submit();
      }
   </script>
</head>
<body>
<font color="white">
${msg }
</font>
<br>
<br>
<div class="demoDOTA2"></div>

<form id="myform" action="<%=path%>/<%=aab108.equals("1")?"querySellOrder.html":"queryGetAcc.html"%>" method="post">
	<!-- ���ݵ����� -->
	
	<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:90%">
	   <caption align="left"><font color="white" size="5px"><%=aab108.equals("1")?"��ʷ�����б�":"���ջ��б�"%></font> </caption>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="16">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td><a href="#" onclick="onEdit('${ins.aad301 }')">${ins.aac602 }</a></td>
				    <td>${ins.aac604 }</td>
				    <td>${ins.aad302 }</td>
				    <td>${ins.aad305 }</td>
				    <td>${ins.aad304 }</td>
				    <td>${ins.fvalue }</td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="16">
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
	        <c:forEach begin="1" step="1" end="16">
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
	<table align="center">
	  <tr>
	   <td align="center">
	       <input type="submit" class="btn btn-secondary  active" onclick="back()" name="next" value="<%=aab108.equals("1")?"�鿴��ʷ����":"�鿴���ջ��б�"%>"
              formaction="<%=path%>/<%=aab108.equals("1")?"querySellOrder.html":"queryGetAcc.html"%>">
               <input type="submit" onclick="back()" class="btn btn-secondary  active" formaction="<%=path%>/mainPage.jsp" value="����">
               <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="${aab101} ">
</form>
<%@include file="footer.jsp" %>
<script type="text/javascript">

</script>
</body>
</html>