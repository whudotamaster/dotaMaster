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
<form action="<%=path%>/modifyEvent.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               赛事修改
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">赛事</td>
   </tr>
   <tr>
     <td>赛事名</td>
     <td>
       <e:text name="aac702" required="true" readonly="${aab108!=2}"  defval="${ins.aac702 }"/> 
     </td>
   </tr>
   <tr>
     <td>赛事级别</td>
     <td>
       <e:text name="aac703"  required="true"  readonly="${aab108!=2}" defval="${ins.aac703 }"/>
     </td>
   </tr> 
   <tr>
     <td>赛事总奖金</td>
     <td>
        <e:text name="aac704"  required="true"  readonly="${aab108!=2}" defval="${ins.aac704 }"/> 
     </td>
   </tr>
   <tr>
     <td>赛事开放时间</td>
     <td>
       <e:date name="aac705"  required="true"  readonly="${aab108!=2}" defval="${ins.aac705 }"/> 
     </td>
   </tr>  
  
   <tr>
     <td>赛事结束时间</td>
     <td>
       <e:date name="aac706"  required="true"  readonly="${aab108!=2}" defval="${ins.aac706 }"/> 
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
        <!-- 管理员可见的两个按钮 -->
		<c:if test="${aab108==2}">
			<input type="submit" name="next" value="修改" 
              formaction="<%=path%>/modifyEvent.html"
              formnovalidate="formnovalidate">
		</c:if>
     </td>
   </tr>  
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
</body>
</html>