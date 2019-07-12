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
              选手添加   
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">选手</td>
   </tr>
   <tr>
     <td>选手头像</td>
     <td>
       <e:text name="aac1004"  required="true"   /> 
     </td>
   </tr> 
   <tr>
     <td>选手名</td>
     <td>
       <e:text name="aac1002" required="true"   /> 
     </td>
   </tr>
   <tr>
     <td>选手昵称</td>
     <td>
       <e:text name="aac1003"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>所属战队</td>
     <td>
       <e:text name="aac902"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>选手简介</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1005" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addPlayer.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryPlayer.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>