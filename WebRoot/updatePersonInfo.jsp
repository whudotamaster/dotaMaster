<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>�޸ĸ�����Ϣ</title>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<form action="<%=path%>/updtPsnInf.html" method="post">
<table border="1" align="center" width="45%">
  <caption>
       ������Ϣ�޸�<hr width="160">
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
 	       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }"/> 
	 	</td>
	 </tr>
	 <tr>
	 	<td>����</td>
	 	<td>
 	       <e:text name="aab104" required="true" defval="${ins.aab104 }"/> 
	 	</td>
	 </tr>
	  <tr>
	 	<td>ͷ��</td>
	 	<td>
 	       <e:text name="aab105" defval="${ins.aab105 }"/> 
	 	</td>

</table>
<input  type="hidden" name="aab101" value="<%=aab101%>">
	
 <input type="submit" name="next"  value="�޸�">
 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="������ҳ">
</form>
	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
</body>
</html>