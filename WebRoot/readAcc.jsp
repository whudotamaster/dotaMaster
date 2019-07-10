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
               饰品信息浏览
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">饰品</td>
   </tr>
   <tr>
     <td>饰品名</td>
     <td>
       <e:text name="aac602"  readonly="true"  defval="${ins.aac602 }"/> 
     </td>
   </tr>
   <tr>
     <td>饰品归属英雄</td>
     <td>
       <e:text name="aac102"    readonly="true" defval="${ins.aac102 }"/>
     </td>
   </tr>
   
   <tr>
     <td>饰品图片</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:15%; height:100%">
     </td>
   </tr>  
  <tr>
     <td>回收价格</td>
     <td>
       <e:text name="aac604"    readonly="true" defval="${ins.aac604 }"/> 
     </td>
   </tr>  
   <tr>
     <td>兑换价格</td>
     <td>
       <e:text name="aac605"    readonly="true" defval="${ins.aac605 }"/> 
     </td>
   </tr>  
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aab101 }">
</form>
</body>
</html>