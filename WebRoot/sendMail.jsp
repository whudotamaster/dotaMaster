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
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
          向站长投诉
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">对管理员不满？来写封邮件告诉Boss开了他！请键入你想要投诉的网站操作员违规操作和发生时间，我们将认真进行查验。</td>
   </tr>
   <tr>
     <td>管理员昵称</td>
     <td>
       <e:text name="admin" required="true"   /> 
     </td>
   </tr>
 
   <tr>
     <td>违规操作</td>
     <td>
       <e:text name="violation"  required="true"   /> 
     </td>
   </tr>  

   <tr>
     <td>发生时间</td>
     <td>
       <e:text name="time"  required="true"   /> 
     </td>
   </tr>  
   
   <tr>
     <td>详细内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="details" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
   			 <c:if test="${aab101==null}">
     			<input type="submit" name="next" value="发送"
             			 formaction="<%=path%>/login.jsp"
             			 formnovalidate="formnovalidate">
             </c:if>
        	<c:if test="${aab101!=null}">
   				<input type="submit" name="next" value="发送"
			             formaction="<%=path%>/sendMail.htm">
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