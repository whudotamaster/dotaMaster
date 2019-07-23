<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>添加比赛</title>
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
${msg}
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<div class="demoMatch" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
     <tr>
      <td>
              <font color="#000000" size="5px">比赛添加   </font>
         </td>
      </tr>
   <tr>
     <td colspan="2">比赛</td>
   </tr>
   <tr>
     <td>赛事名称</td>
     <td>
       <e:text name="aac702"  required="true"   /> 
     </td>
   </tr> 
   <tr>
     <td>比赛开始时间</td>
     <td>
        <input name="aac1102" type="datetime-local" />
     </td>
   </tr>
   <tr>
     <td>战队1名称</td>
     <td>
       <e:text name="aac1103"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>战队2名称</td>
     <td>
       <e:text name="aac1104"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addMatch.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>