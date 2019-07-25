<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="header.jsp" %>
<html>
<head>
   <title>�����������</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   <style type="text/css">
     tr
     {
        height:40px;
     }
   </style>
   
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?aab101="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onBet(vaad101,vaac1101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/ModifyComp.html?aac1105="+vaad101+"&aac1101="+vaac1101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body onload="imgOnLoad('Lina2','jpg');pageOnLoad()">

<br>
<br>
<form id="myform" action="<%=path%>/queryComp.html" method="post">
	<!-- ���ݵ����� -->
	
<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.85;width:90%">
	   <caption align="left"><font color="white" size="5px">����</font> </caption>
	  <tr>
	    <td>���</td>
	    <td>����</td>
	    <td>ս��1</td>
	    <td>ս��2</td>
	    <td>������ʼʱ��</td>
	    <td></td>
	    <td></td>
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
			
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>${ins.aac1103 }</td>
				    <td>${ins.aac1104 }</td>
				    <td>${ins.aac1102 }</td>
				    <td>
				      <a href="#" onclick="onBet('1','${ins.aac1101}')">ս��1��ʤ</a>
				    </td>
				    <td>
				      <a href="#" onclick="onBet('2','${ins.aac1101}')">ս��2��ʤ</a>
				    </td>
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
	<table align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="��ѯ">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>