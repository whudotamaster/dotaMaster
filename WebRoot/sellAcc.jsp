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
      	 <caption align="left"><font color="#000000" size="5px">${empty ins.aad303?'������Ʒ':'��������' }</font> </caption>
   <tr>
     <td colspan="2">��Ʒ����:  ${ins.aac602 }</td>
   </tr>
    <tr>
     <td colspan="2">�۸�:  ${ins.aac604 }</td>
   </tr>
   <tr>
     <td>dota2��ϷID</td>
     <td>
       <e:text name="aad302" defval="${ins.aad302 }" readonly="${!empty ins.aad303?'true':'false' }"  />
     </td>
   </tr>
	<c:if test="${empty ins.aad303 }">
	   <tr>
	     <td>�ٷ���ϷID</td>
	     <td>
	       <e:text name=""  readonly="true" defval="194983668"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>����</td>
     <td>
       <e:textarea rows="5" cols="45" name="aad304" defval="${ins.aad304 }" readonly="${!empty ins.aad303?'true':'false' }" />
     </td>
   </tr>
   
   <c:if test="${!empty ins.aad303}">
    <tr>
     <td colspan="2">���״̬:${ins.fvalue }</td>
   </tr>
   </c:if>

   <tr>
     <td colspan="2" align="center">
     <c:choose>
     <c:when test="${empty ins.aad303}">
     <input type="submit" name="next" value="ȷ���ѷ���"
              formaction="<%=path%>/sellAcc.html">
     <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryBet.html">
     </c:when>
     <c:when test="${ins.aad303==0}">
     <c:if test="${aab108==2}">
     <input type="submit" name="next" value="ȷ�����ջ�"
              formaction="<%=path%>/modifyGetAcc.html">
     <input type="submit" name="next" value="�ջ�ʧ��"
              formaction="<%=path%>/modifyGetAcc.html">
     <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryGetAcc.html">
     </c:if>  
      <c:if test="${aab108!=2}">
     <input type="submit" name="next" value="����" 
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