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
<form action="<%=path%>/sellAcc.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
      	 ${empty ins.aad303?'������Ʒ':'��������' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">��Ʒ����:  ${ins.aac602 }</td>
   </tr>
    <tr>
     <td colspan="2">�۸�:  ${ins.aac605 }</td>
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
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty ins.aad303?'ȷ���ѷ���':'���ջ�' }"
              formaction="<%=path%>/${empty ins.aad303?'sellAcc':'modifyGetAcc' }.html">
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="1">
<input type="hidden" name="aac601" value="1">
<input type="hidden" name="aad301" value="${ins.aad301 }">
</form>
</body>
</html>