<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
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
<br>
<br>
<form action="<%=path%>/findByIdAcc.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               饰品添加
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">饰品</td>
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
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addAcc.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aac601 }">
</form>
</body>
</html>