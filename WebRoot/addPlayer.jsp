<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>添加选手</title>
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
<body onload="imgOnLoad('PlayerBg','jpg');pageOnLoad()">
${msg}
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:45%">
    <tr>
      <td>
          <font color="#000000" size="5px">选手添加</font>   
    </td>
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
     <input type="submit" class="btn btn-secondary  active"  name="next" value="添加"
              formaction="<%=path%>/addPlayer.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryPlayer.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>