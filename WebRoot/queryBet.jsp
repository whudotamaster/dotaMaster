<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <%@ include file="header.jsp" %>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   
   <script type="text/javascript">    
      function onBet(vaad101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/playBet.html?aad101="+vaad101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      $("#totalCnt").change(function () {
          var totalCnt = $("#totalCnt").val();
          if (totalCnt != parseInt(totalCnt)){
              $.sobox.alert(
                      '��ܰ��ʾ',
                      '��������ȷ��������',
                      function () {
                          $("#totalCnt").val("");
                      }
              )
              return false;
          }
      })
      
   </script>
</head>
<body>

${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryBet.html" method="post">
	<!-- ���ݵ����� -->
	
	<table border="1" width="95%" align="center">
	 <caption>
	               ��Ѻע����
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>���</td>
	    <td>����</td>
	    <td>ս��1</td>
	    <td>ս��2</td>
	    <td>������ʼʱ��</td>
	    <td>A��Ѻע����</td>
	    <td>B��Ѻע����</td>
	    <td>ѺעA��</td>
	    <td>ѺעB��</td>
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
				    <td>${ins.aad102 }</td>
				    <td>${ins.aad103 }</td>
				    <td>
				      <input type="text" name="aad202" defval="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				    <td>
				      <input type="text" name="aad203" defval="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				   <td>
				      <a href="#" onclick="onBet('${ins.aad101}')">��ע</a>
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
	             <td></td>
	             <td></td>
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="�鿴��ʷѺע" 
	              formaction="<%=path%>/queryUserBet.html">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
<form action="<%=path%>/buyVIP.html" method="post">
<input type="search" name="month" placeholder="���뿪ͨ������" align="center" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
<input type="submit" name="next" value="��ͨ" align="center">
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aab109" value="<%=aab109 %>">
</form>
</body>
</html>