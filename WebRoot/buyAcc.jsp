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
${msg }
<br>
<br>
<form action="<%=path%>/buyAcc.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
      	 ${empty ins.aad403?'购买饰品':'订单详情' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">饰品名称:  ${ins.aac602 }影魔至宝</td>
   </tr>
    <tr>
     <td colspan="2">价格:${ins.aac605 }</td>
   </tr>
   <tr>
     <td>dota2游戏ID</td>
     <td>
       <e:text name="aad402" defval="${ins.aad402 }" readonly="${!empty ins.aad403?'true':'false' }"  />
     </td>
   </tr>
   <tr>
     <td>留言</td>
     <td>
       <e:textarea rows="5" cols="45" name="aad404" defval="${ins.aad404 }" readonly="${!empty ins.aad403?'true':'false' }" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aad403?'已发货':'购买' }"
              formaction="<%=path%>/${empty param.aad403?'modifySendAcc':'buyAcc' }.html">
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="1">
<input type="hidden" name="aac601" value="1">
<input type="hidden" name="aad401" value="${ins.aad401 }">
</form>
</body>
</html>