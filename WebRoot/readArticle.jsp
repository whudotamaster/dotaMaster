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
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               文章${empty param.aab801?'添加':'阅读' }
       ${empty param.aab801 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">文章</td>
   </tr>
   <tr>
     <td>文章标题</td>
     <td>
       <e:text name="aab802" required="true" readonly="true"  defval="${ins.aab802 }"/> 
     </td>
   </tr>
   <tr>
     <td>文章作者</td>
     <td>
       <e:text name="aab102"  required="true"  readonly="true" defval="${ins.aab102 }"/>
     </td>
   </tr>
   
   <c:if test="${!empty param.aab101 }">
   <tr>
     <td>发布时间</td>
     <td>
        <e:text name="aab805"  required="true"  readonly="true" defval="${ins.aab805 }"/> 
     </td>
   </tr>
   </c:if>
   <tr>
     <td>文章类型</td>
     <td>
       <e:text name="aab806"  required="true"  readonly="true" defval="${ins.aab806 }"/> 
     </td>
   </tr>  
  
   <tr>
     <td>文章内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" readonly="true"  defval="${ins.aab803 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108!=2}">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </c:if>
<<<<<<< HEAD
        <!-- 管理员可见的两个按钮 -->
=======
 <!-- 管理员可见的两个按钮 -->
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
		<c:if test="${aab108==2}">
			<input type="submit" name="next" value="返回" 
              formaction="<%=path%>/adminQueryArticle.html"
              formnovalidate="formnovalidate">
			<input type="submit" name="pass" value="审核通过"
					formaction="<%=path%>/passArticle.html"
					formnovalidate="formnovalidate">
			<input type="submit" name="unpass" value="审核不通过"
					formaction="<%=path%>/unpassArticle.html"
					formnovalidate="formnovalidate">
		</c:if>

     </td>
   </tr>
<<<<<<< HEAD
   		<input type="hidden" name="aab801" value="${ins.aab801 }">  
=======
   		<input type="hidden" name="aab801" value="${ins.aab801 }">
   
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</table>
</form>
</body>
</html>