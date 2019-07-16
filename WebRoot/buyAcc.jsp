<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:40px;
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
<br>

<div class="demoTa" style="opacity: 0.9"></div>
<form action="<%=path%>/buyAcc.html" method="post">
<table border=2 align="center" class="table" style="background-color:white;opacity: 0.95;width:45%">
      	 <caption align="left"><font color="#000000" size="5px">${empty ins.aad403?'购买饰品':'订单详情' }</font> </caption>
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
              formaction="<%=path%>/findByIdAcc.html?aac601=${ins.aac601 }">
     </c:when>
     <c:when test="${ins.aad403==0}">
     <c:if test="${aab108==2} ">
     <input type="submit" name="next" value="已发货"
              formaction="<%=path%>/modifySendAcc.html">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/findByIdAcc.html?aac601=${ins.aac601 }">
     </c:if>  
      <c:if test="${aab108!=2}">
     <input type="submit" name="next" value="返回" 
             formaction="<%=path%>/findByIdAcc.html?aac601=${ins.aac601 }">
     </c:if>  
     </c:when>
     </c:choose>
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aac601" value="${ins.aac601} ">
<input type="hidden" name="aad401" value="${ins.aad401 }">
</form>
</body>
</html>