<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<link rel="shortcut icon" href="ico/favicon.ico" />
<title>添加文章</title>
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
<div class="demoTa" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:45%">
   <tr>
    <td colspan="2" >
        <font color="#000000" size="5px"> 文章${empty param.aab801?'添加':'阅读' }</font>
    </td>
    </tr>
   <tr>
     <td colspan="2">文章</td>
   </tr>
   <tr>
     <td>文章标题</td>
     <td>
       <e:text name="aab802" required="true"   /> 
     </td>
   </tr>
 
   <tr>
     <td>文章类型</td>
     <td>
       <e:radio name="aab806"  required="true"  value="其他:0,比赛战报:1,英雄攻略:2" defval="0" /> 
     </td>
   </tr>  

   <tr>
     <td>文章内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" />
     </td>
   </tr>
   <input type="hidden" name="aab101" value="<%=aab101%>">
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addArticle.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>