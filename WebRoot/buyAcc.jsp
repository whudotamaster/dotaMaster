<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path=request.getContextPath(); 
String aab101=(String)session.getAttribute("aab101");
String aab108=(String)session.getAttribute("aab108");
boolean tag=(boolean)session.getAttribute("tag");
%>
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
ins.aad403
<br>
aad403:${ins.aad403}
<br>
aab108:<%=aab108 %>

<%=tag %>
<form action="<%=path%>/buyAcc.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
      	 ${empty ins.aad403?'购买饰品':'订单详情' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">饰品名称:  ${ins.aac602 }</td>
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
   <c:if test="${!empty ins.aad403}">
    <tr>
     <td colspan="2">完成状态:${ins.fvalue }</td>
   </tr>
   </c:if>
   <tr>
     <td colspan="2" align="center">
     <c:choose>
     <c:when test="${empty ins.aad403}">
     <input type="submit" name="next" value="购买"
              formaction="<%=path%>/buyAcc.html">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryBet.html">
     </c:when>
     <c:when test="${ins.aad403==0}">
     <c:if test="<%=tag%>">
     <input type="submit" name="next" value="已发货"
              formaction="<%=path%>/modifySendAcc.html">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/querySendAcc.html">
     </c:if>  
      <c:if test="<%=!tag%>">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryBuyOrder.html">
     </c:if>  
     </c:when>
     </c:choose>
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aac601" value="1">
<input type="hidden" name="aad401" value="${ins.aad401 }">
</form>
</body>
</html>