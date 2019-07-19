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
<%@ include file="header.jsp" %>
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
       <e:text name="aac602"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac602 }"/> 
     </td>
   </tr>
   <tr>
     <td>饰品归属英雄</td>
     <td>
       <e:text name="aac101"    readonly="${aab108!=2}" required="true" defval="${ins.aac101 }"/>
     </td>
   </tr>
   <c:if test="${aab108!=2}">
   <tr>
     <td>饰品图片</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:15%; height:100%">
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108==2}" >
   <tr>
     <td>饰品图片链接</td>
     <td >
       <e:text name="aac603"  required="true"  defval="${ins.aac603 }" />
     </td>
   </tr>  
   </c:if>
  <tr>
     <td>回收价格</td>
     <td>
       <e:text name="aac604"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac604 }"/> 
     </td>
   </tr>  
   <tr>
     <td>兑换价格</td>
     <td>
       <e:text name="aac605"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac605 }"/> 
     </td>
   </tr>  
   <tr>
     <td>库存</td>
     <td>
       <e:text name="aac606"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac606 }"/> 
     </td>
   </tr> 
   <tr>
     <td colspan="2" align="center">
       <c:if test="${aab108==2}">
       <input type="submit" name="next" value="购买" 
              formaction="<%=path%>/findForBuyAcc.html"
              formnovalidate="formnovalidate">
       <input type="submit" name="next" value="出售" 
              formaction="<%=path%>/findForSellAcc.html"
              formnovalidate="formnovalidate">
       </c:if>       
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" name="next" value="修改" formaction="<%=path%>/modifyAcc.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aac601 }">
<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
</body>
</html>