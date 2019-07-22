<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="shortcut icon" href="ico/favicon.ico" />
<title>添加饰品</title>
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
<%@ include file="header.jsp" %>
<div class="demoAcc" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdAcc.html" method="post">
<table align="center" class="table table-striped" style="background-color:#ABCDE7;opacity: 0.9;width:45%">
   <tr>
    <td>
        <font color="#000000" size="5px">饰品添加</font>
    </td>
    </tr>
   <tr>
     <td>饰品名</td>
     <td>
       <e:text name="aac602" required="true" autofocus="true" /> 
     </td>
   </tr>
   <tr>
     <td>饰品图片</td>
     <td>
       <e:text name="aac603"  required="true" />
     </td>
   </tr>
   <tr>
     <td>饰品归属英雄名</td>
     <td>
       <e:text name="aac102" required="true" />
     </td>
   </tr>
   <tr>
     <td>回收价格</td>
     <td>
       <e:text name="aac604"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>库存价格</td>
     <td>
       <e:text name="aac605"  required="true"   /> 
     </td>
   </tr>  
    <tr>
     <td>库存</td>
     <td>
       <e:text name="aac606"  required="true"   /> 
     </td>
   </tr> 
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="添加"
              formaction="<%=path%>/addAcc.html">
       <input type="submit" class="btn btn-secondary  active"  name="next" value="返回" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aac601 }">
</form>
</body>
</html>