<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
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
<br>
<br>
<form action="<%=path%>/findByIdChangelog.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
                ������־���
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">������־</td>
   </tr>
   <tr>
     <td>�汾��</td>
     <td>
       <e:text name="aac1202" required="true" autofocus="true" /> 
     </td>
   </tr> 
    <tr>
     <td>��������</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1203" defval="${ins.aac1203 }" required="true" />
     </td>
   </tr>
   <tr>
     <td>����ʱ��</td>
     <td>
       <e:text name="aac1204"  required="true" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="���"
              formaction="<%=path%>/addChangelog.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryChangelog.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac701" value="${param.aac1201 }">
</form>
</body>
</html>