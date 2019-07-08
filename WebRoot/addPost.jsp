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
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       发帖
       ${empty param.aab101 }
      <hr width="160">
    </caption>
   <c:choose>
   <c:when test="${!empty param.aab101 }">
      <tr>
	     <td>标题</td>
	     <td>
	       <e:text name="apaab502"  required="true" defval=""/> 
	     </td>
	   </tr>
	   <tr>
     <td>內容</td>
     <td>
       <e:textarea rows="5" cols="45" name="apaab503" required="true" defval=""/>
     </td>
   </tr>
   </c:when>
<c:otherwise>
<tr>
<td>
	你没有登录不能发帖
	</td>
	</tr>
</c:otherwise>
</c:choose>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'登录':'发帖' }"
              formaction="<%=path%>/${empty param.aab101?'login':'addPost' }.html?aab101=${param.aab101 }">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/forum.html?aab101=${param.aab101 }"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>