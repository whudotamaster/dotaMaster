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
 <c:if test="${ aab108==2 }">
 </c:if>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               比赛${aab108==2?'浏览':'修改' }
      ${aab108==2}
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">文章</td>
   </tr>
   <tr>
     <td>赛事名</td>
     <td>
       <e:text name="aac702" required="true" readonly="${aab108!=2 }"  defval="${ins.aac702 }"/> 
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
     <td>胜负</td>
     <td>
           比赛<e:select name="aac1105" value="未开始:00,胜:01,负:02" defval="${ins.aac1105 }" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
        <c:if test="${ aab108==2 }">
        <input type="submit" name="next" value="修改" 
              formaction="<%=path%>/modifyMatch.html"
              formnovalidate="formnovalidate">   
        </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1101" value="${param.aac1101 }">
</form>
</body>
</html>