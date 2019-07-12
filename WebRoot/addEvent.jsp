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
<form action="<%=path%>/findByIdEvent.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
                赛事添加
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">赛事</td>
   </tr>
   <tr>
     <td>赛事名</td>
     <td>
       <e:text name="aac702" required="true" autofocus="true" /> 
     </td>
   </tr> 
    <tr>
     <td>赛事级别</td>
     <td>
       <e:text name="aac703"  required="true" />
     </td>
   </tr>
   <tr>
     <td>赛事总奖金</td>
     <td>
       <e:text name="aac704"  required="true" />
     </td>
   </tr>
   <tr>
     <td>赛事开放时间</td>
     <td>
       <e:date name="aac705"  required="true" />
     </td>
   </tr>
   <tr>
     <td>赛事结束时间</td>
     <td>
       <e:date name="aac706"  required="true" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addEvent.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
</body>
</html>