<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>��վͶ��</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body>
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/addComplain.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
          �����ԱͶ��
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����վ�н�����������������Ա�����԰ɣ����������Ҫ���ߵ��¼������ǵĹ���Ա�ᾡ����㴦��</td>
   </tr>
  
   <tr>
     <td>����</td>
     <td>
       <e:text name="aad502"  required="true"   /> 
     </td>
   </tr>  


   <tr>
     <td>��ϸ����</td>
     <td>
       <e:textarea rows="5" cols="45" name="aad503" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" name="next" value="�ύ"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" name="next" value="�ύ">
        	 </c:if>
		        <input type="submit" name="next" value="������ҳ" 
		                 formaction="<%=path%>/mainPage.jsp"
		              	 formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
	 <input type="hidden" name="aab101" value="<%=aab101%>">
</form>
</body>
</html>