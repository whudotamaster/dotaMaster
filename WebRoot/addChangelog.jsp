<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body onload="imgOnLoad('MatchBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/findByIdChangelog.html" method="post">
<table align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
   <tr>
    <td>
        <font color="#000000" size="5px"> 更新日志添加</font>
   </td>
    </tr>
   <tr>
     <td>版本号</td>
     <td>
       <e:text name="aac1202" required="true" autofocus="true" /> 
     </td>
   </tr> 
    <tr>
     <td>更新内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1203" defval="${ins.aac1203 }" required="true" />
     </td>
   </tr>
   <tr>
     <td>更新时间</td>
     <td>
        <input name="aac1204" required="required"  type="datetime-local" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108==2}">
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addChangelog.html">
              </c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryChangelog.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac701" value="${param.aac1201 }">
</form>
</body>
</html>