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
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
          ��վ��Ͷ��
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">�Թ���Ա��������д���ʼ�����Boss�����������������ҪͶ�ߵ���վ����ԱΥ������ͷ���ʱ�䣬���ǽ�������в��顣</td>
   </tr>
   <tr>
     <td>����Ա�ǳ�</td>
     <td>
       <e:text name="admin" required="true"   /> 
     </td>
   </tr>
 
   <tr>
     <td>Υ�����</td>
     <td>
       <e:text name="violation"  required="true"   /> 
     </td>
   </tr>  

   <tr>
     <td>����ʱ��</td>
     <td>
       <e:text name="time"  required="true"   /> 
     </td>
   </tr>  
   
   <tr>
     <td>��ϸ����</td>
     <td>
       <e:textarea rows="5" cols="45" name="details" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" name="next" value="����"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" name="next" value="����"
			             formaction="<%=path%>/sendMail.htm">
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