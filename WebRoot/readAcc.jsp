<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>${ins.aac602 }详细信息</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />

<style type="text/css">
  td{
      height:50px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body onload="imgOnLoad('AccBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdAcc.html" method="post">
<table  align="center" border="1" style="background-color:#ABCDE7;opacity: 0.9;width:45% ">
    <tr>
    <td colspan="2">
      <font color="#000000" size="5px"> 饰品信息浏览</font>
    </td>
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
       <e:text name="aac102"    readonly="true" required="true" defval="${ins.aac102 }"/>
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
       <input type="submit" class="btn btn-secondary  active" name="next" value="购买" 
              formaction="<%=path%>/findForBuyAcc.html"
              formnovalidate="formnovalidate">
       <input type="submit" class="btn btn-secondary  active" name="next" value="出售" 
              formaction="<%=path%>/findForSellAcc.html"
              formnovalidate="formnovalidate">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" class="btn btn-secondary  active" name="next" value="修改" formaction="<%=path%>/modifyAcc.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aac601 }">
<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>