<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>添加战队</title>
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
<body onload="imgOnLoad('TeamBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdTeam.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#EEEEEE;opacity: 0.9;width:45%">
   <tr>
    <td>
        <font color="#000000" size="5px">战队添加</font> 
    </td>
    </tr>
   <tr>
     <td colspan="2">战队</td>
   </tr>
   <tr>
     <td>战队名</td>
     <td>
       <e:text name="aac902" required="true" autofocus="true" /> 
     </td>
   </tr>
   <tr>
     <td>战队图片</td>
     <td>
       <e:text name="aac903"  required="true" />
     </td>
   </tr>
    <tr>
     <td>战队简介</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac904" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addTeam.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryTeam.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac901" value="${param.aac901 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>