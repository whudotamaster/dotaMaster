<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>�޸ĸ�����Ϣ</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
${msg }
<form  method="post" action="<%=path%>/updtPsnPwd.html" name="myform" >
<table border="1" align="center" width="45%">

  <caption>
       ������Ϣ�޸�action="<%=path%>/updtPsnPwd.html"<hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${ins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>������ԭ����</td>
	 	<td>
	 	<input type="password" id="oaab104" name="oaab104" required="required"/>	    
	 	</td>
	 </tr>	 
	  <tr>
	 	<td>������������</td>
	 	<td>
	 	<input type="password" id="naab104" name="naab104" required="required"/>
	 	</td>
	 </tr>	
	 <tr>
	 	<td>��ȷ��������</td>
	 	<td>
 		 	<input type="password" id="maab104" name="maab104" required="required"/>
	 	</td>
	 </tr>
</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
 <input type="submit" name="next"   onclick="onCompare()"  value="ȷ���޸�">
 <input type="submit" name="Submit" formaction="<%=path%>/updtPsnInf.html"   formnovalidate="formnovalidate" value="�����޸�">
</form>
	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
</body>
<script type="text/javascript">
function onCompare()
{
	 var vform = document.getElementById("myform");
	 var o = document.getElementById("oaab104").value; 
	 var m = document.getElementById("maab104").value;
	 var n = document.getElementById("naab104").value;
	 if(m==n&&m!=null&&o!=m)
		 {
		 vform.action="<%=path%>/updtPsnPwd.html";
    	 vform.submit();
		 }
	 else
		 {
		 alert("ȷ������ʧ�ܣ�����������");
		 }
}


</script>
</html>