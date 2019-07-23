<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>添加赛事</title>
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
<body onload="imgOnLoad('EventBg','jpg');pageOnLoad()">
${msg}
<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/findByIdEvent.html" method="post">
<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:45%">
   <tr>
    <td>
        <font color="#000000" size="5px"> 赛事添加</font>
   </td>
    </tr>
   <tr>
     <td colspan="2">赛事</td>
   </tr>
   <tr>
     <td>赛事名</td>
     <td>
       <e:text name="aac702" required="true" readonly="true" autofocus="true" /> 
     </td>
   </tr> 
    <tr>
     <td>赛事级别</td>
     <td>
      <e:radio name="aac703"  required="true"  value="Major:0,Minor:1,其他:2" defval="0" /> 
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
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addEvent.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>