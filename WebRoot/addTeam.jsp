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
<form action="<%=path%>/findByIdTeam.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
                ս�����
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">ս��</td>
   </tr>
   <tr>
     <td>ս����</td>
     <td>
       <e:text name="aac902" required="true" autofocus="true" /> 
     </td>
   </tr>
   <tr>
     <td>ս��ͼƬ</td>
     <td>
       <e:text name="aac903"  required="true" />
     </td>
   </tr>
    <tr>
     <td>ս�Ӽ��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac904" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="���"
              formaction="<%=path%>/addTeam.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryTeam.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac901" value="${param.aac901 }">
</form>
</body>
</html>