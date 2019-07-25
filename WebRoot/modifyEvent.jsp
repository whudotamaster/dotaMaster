<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>修改赛事</title>
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
<body onload="imgOnLoad('EventBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<!-- 引入头部导航栏 -->
<br>
<br>
<form action="<%=path%>/modifyEvent.html" method="post">
<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:45%">
   <tr>
    <td>
      <font style="color:#000000" size="5px">赛事修改</font> 
    </td>
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
       <e:radio name="aac703"  required="true"  readonly="${aab108!=2}" value="Major:0,Minor:1,其他:2" defval="${ins.aac703 }" />
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
        <!-- 管理员可见的两个按钮 -->
       <c:if test="${aab108==2}">
			<input type="submit" class="btn btn-secondary  active" name="next" value="修改" 
              formaction="<%=path%>/modifyEvent.html"
              formnovalidate="formnovalidate">
		</c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>  
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>