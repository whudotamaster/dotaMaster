<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>查看更新日志</title>
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
<body>
<body onload="imgOnLoad('EventBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

${ins.aac1204 }
<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
    <tr>
      <td>
              <font color="#000000" size="5px">更新日志${aab108!=2?'浏览':'修改' }   </font>
         </td>
      </tr>
   <tr>
     <td colspan="2">更新日志</td>
   </tr>
   <tr>
     <td>更新版本号</td>
     <td>
       <e:text name="aac1202"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac1202 }"/> 
     </td>
   </tr>
   <tr>
     <td>更新内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1203" required="true" readonly="${aab108!=2}"  defval="${ins.aac1203 }"/>
     </td>
   </tr>
   <tr>
     <td>更新时间</td>
     <td>
       <input name="aac1204" required="required"  type="datetime-local" value="${ins.aac1204 }" /> 
     </td>
   </tr>  
   <tr>
     <td colspan="2" align="center">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryChangelog.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" class="btn btn-secondary  active" name="next" value="修改" formaction="<%=path%>/modifyChangelog.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1201" value="${param.aac1201 }">
</form>
</body>
</html>