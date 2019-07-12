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
                战队添加
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">战队</td>
   </tr>
   <tr>
     <td>战队名</td>
     <td>
       <e:text name="aac902" required="true" autofocus="true" /> 
     </td>
   </tr>
   <tr>
     <td>战队图片</td>
     <td>
       <e:text name="aac903"  required="true" />
     </td>
   </tr>
    <tr>
     <td>战队简介</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac904" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addTeam.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryTeam.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac901" value="${param.aac901 }">
</form>
</body>
</html>