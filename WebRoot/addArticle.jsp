<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Insert title here</title>
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
               ����${empty param.aab801?'���':'�Ķ�' }
       ${empty param.aab801 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>���±���</td>
     <td>
       <e:text name="aab802" required="true"   /> 
     </td>
   </tr>
 
   <tr>
     <td>��������</td>
     <td>
       <e:text name="aab806"  required="true"   /> 
     </td>
   </tr>  

   <tr>
     <td>��������</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" />
     </td>
   </tr>
   <input type="hidden" name="aab101" value="<%=aab101%>">
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="���"
              formaction="<%=path%>/addArticle.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>