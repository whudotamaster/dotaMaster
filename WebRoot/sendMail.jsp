<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <link rel="shortcut icon" href="ico/favicon.ico" />

<title>��վͶ��</title>
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
${msg}
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" style="background-color:#a09373;opacity: 0.95;width:35%" >
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
       <e:textarea rows="5" cols="45" name="details"  style="resize:none" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" class="btn btn-secondary" name="next" value="����"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" class="btn btn-secondary" name="next" value="����"
			             formaction="<%=path%>/sendMail.htm">
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