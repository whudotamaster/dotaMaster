<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>��վͶ��</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
  td{
      height:75px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body onload="imgOnLoad('complaintAdmin','png');pageOnLoad()">
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/addComplain.html" method="post">
<table  border="1" align="center" style="background-color:#a09373;opacity: 0.95;width:35%">
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
       <e:textarea rows="5" cols="45" name="aad503"  style="resize:none" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" class="btn btn-secondary" name="next" value="�ύ"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" class="btn btn-secondary" name="next" value="�ύ">
        	 </c:if>
		        <input type="submit" class="btn btn-secondary" name="next" value="������ҳ" 
		                 formaction="<%=path%>/mainPage.jsp"
		              	 formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
	 <input type="hidden" name="aab101" value="<%=aab101%>">
</form>
</body>
</html>