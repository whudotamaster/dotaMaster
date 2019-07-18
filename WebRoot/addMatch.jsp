<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
${msg}
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  border="1" align="center" width="45%">
      <caption>
              比赛添加   
    </caption>
   <tr>
     <td colspan="2">选手</td>
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
        <input type="datetime-local" value=""/>
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
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addMatch.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>