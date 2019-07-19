<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>网站投诉</title>
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
<form action="<%=path%>/addComplain.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
          向管理员投诉
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">对网站有建议或意见？来给管理员留个言吧！请键入你想要申诉的事件，我们的管理员会尽快帮你处理！</td>
   </tr>
  
   <tr>
     <td>标题</td>
     <td>
       <e:text name="aad502"  required="true"   /> 
     </td>
   </tr>  


   <tr>
     <td>详细内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aad503" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" name="next" value="提交"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" name="next" value="提交">
        	 </c:if>
		        <input type="submit" name="next" value="返回主页" 
		                 formaction="<%=path%>/mainPage.jsp"
		              	 formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
	 <input type="hidden" name="aab101" value="<%=aab101%>">
</form>
</body>
</html>