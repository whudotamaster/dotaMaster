<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>比赛详情</title>
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
 <c:if test="${ aab108==2 }">
 </c:if>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
    <tr>
    <td>
        <font color="#000000" size="5px"> 比赛${aab108==2?'修改':'浏览' }</font>
    </td>
    </tr>
   <tr>
     <td>赛事名</td>
     <td>
       <e:text name="aac702" required="true"  readonly="true"  defval="${ins.aac702 }"/> 
     </td>
   </tr>
   <tr>
     <td>比赛开始时间</td>
     <td>
         <e:text name="aac1102"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1102 }"/>
     </td>
   </tr>
   
   <tr>
     <td>对战双方</td>
     <td>
        <e:text name="aac1103"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1103 }"/>VS
        <e:text name="aac1104"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1104 }"/>  
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit"  class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
        <c:if test="${ aab108==2 }">
        <input type="submit"  class="btn btn-secondary  active" name="next" value="修改" 
              formaction="<%=path%>/modifyMatch.html"
              formnovalidate="formnovalidate">   
        </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1101" value="${param.aac1101 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>