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
<div class="demoTa" style="opacity: 0.9"></div>
<form action="<%=path%>/sellAcc.html" method="post">
<table border=3 align="center" class="table" style="background-color:white;opacity: 0.95;width:45%">
      	 <caption align="left"><font color="#000000" size="5px">${empty ins.aad303?'出售饰品':'订单详情' }</font> </caption>
   <tr>
     <td colspan="2">饰品名称:  ${ins.aac602 }</td>
   </tr>
    <tr>
     <td colspan="2">价格:  ${ins.aac604 }</td>
   </tr>
   <tr>
     <td>dota2游戏ID</td>
     <td>
       <e:text name="aad302" defval="${ins.aad302 }" readonly="${!empty ins.aad303?'true':'false' }"  />
     </td>
   </tr>
	<c:if test="${empty ins.aad303 }">
	   <tr>
	     <td>官方游戏ID</td>
	     <td>
	       <e:text name=""  readonly="true" defval="194983668"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>留言</td>
     <td>
       <e:textarea rows="5" cols="45" name="aad304" defval="${ins.aad304 }" readonly="${!empty ins.aad303?'true':'false' }" />
     </td>
   </tr>
   
   <c:if test="${!empty ins.aad303}">
    <tr>
     <td colspan="2">完成状态:${ins.fvalue }</td>
   </tr>
   </c:if>

   <tr>
     <td colspan="2" align="center">
     <c:choose>
     <c:when test="${empty ins.aad303}">
     <input type="submit" name="next" value="确认已发货"
              formaction="<%=path%>/sellAcc.html">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryBet.html">
     </c:when>
     <c:when test="${ins.aad303==0}">
     <c:if test="${aab108==2}">
     <input type="submit" name="next" value="确认已收货"
              formaction="<%=path%>/modifyGetAcc.html">
     <input type="submit" name="next" value="收货失败"
              formaction="<%=path%>/modifyGetAcc.html">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryGetAcc.html">
     </c:if>  
      <c:if test="${aab108!=2}">
     <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/querySellOrder.html">
     </c:if>  
     </c:when>
     </c:choose>
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aac601" value="${ins.aac601} ">
<input type="hidden" name="aad301" value="${ins.aad301 }">
</form>
</body>
</html>