<<<<<<< HEAD
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>ȫ����Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<br>
<form id="myform" action="<%=path%>/queryNoticeHistory.html" method="post">
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>��Ϣ����</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="10">
	    	   	  <tr>
	    	   	    <td>${vs.count }</td>
				    <td>${ins.aad602 }</td>
				    <td>${ins.aad603 }</td>
				   </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="10">
	           <tr>
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
	       <input type="submit" name="next" value="ˢ��" formaction="<%=path%>/queryNoticeHistory.html">
	        <input type="submit" id="del" name="next" value="������ҳ"
	              formaction="<%=path%>/mainPage.jsp">
	        	<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
		<input type="hidden" name="aab101" value="<%=aab101%>">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
=======
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�޸��ҵ���Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />

</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form action="<%=path%>/updtPsnInf.html" method="post">
<table border="1" align="center" width="45%">
  <caption>
       �޸��ҵ���Ϣ
       <hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${ins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>�ǳ�</td>
	 	<td>
 	       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }" />
	 	</td>
	 </tr>
	 <tr>
	 	<td>����</td>
	 	<td>
 	      <a href="changePassword.jsp">�����޸�����</a>
	 	</td>
	 </tr>
	  <tr>
	 	<td>ͷ��</td>
	 	<td>
 	      <img id="avatar" src="/Avatar/${ins.aab105 }" style="height:200px;width:200px;" >
 	  	</td>
		</tr>
	 <tr>
	 <td>��ǰ����ֵ</td>
	 	<td>
 	       <e:text name="aab107" required="true" readonly="true" defval="${ins.aab107 }"/>
	 	</td>
	 	</tr>
	 	 <tr>
	 <td>��ǰ�ȼ�</td>
	 	<td>
		 	<fmt:formatNumber value="${(ins.aab107-ins.aab107%100)/100 }" pattern="#" type="number"/>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>��ǰ���</td>
	 	<td>
 	       <e:text name="aab106" required="true" readonly="true" defval="${ins.aab106 }"/>
	 	</td>
	 </tr>
	 	 <tr>
	 	<td>VIP����ʱ��</td>
	 	<td>
 	       <e:text name="aab109" required="true" readonly="true" defval="${ins.aab109 }"/>
	 	</td>
	 </tr>
</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
 <input type="submit" name="next"  value="�޸�">
 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="������ҳ">
</form>
<form id="form1" action="<%=path%>/uploadUser.htm" method="post" enctype="multipart/form-data">
   <input  type="hidden" name="aab101" value="<%=aab101%>">
    <input type="file" name="file" id="file" >
    <input type="submit" name="next" id="file" value="�ϴ�ͷ��">
</form>
<form action="<%=path%>/buyVIP.html" method="post">
<input type="search" name="month" placeholder="���뿪ͨ������" align="center" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
<input type="submit" name="next" value="��ͨ" align="center">
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aab109" value="<%=aab109 %>">
	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
</body>
    <script>
    window.onload = function () {
        document.querySelector("#file").onchange = function () {
            var req = new XMLHttpRequest();
            var form = new FormData(document.getElementById("form1"));
//          form.append("file",document.querySelector("#file").files[0]);
            req.open("post", "${pageContext.request.contextPath}/upload", true);
            req.send(form);
            req.onload = function () {
                document.getElementById("img").src = "${pageContext.request.contextPath}/pic/" + req.responseText;
            }
        }
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
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</html>