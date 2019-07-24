<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>文章详细</title>
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
<body onload="imgOnLoad('ta','jpg');pageOnLoad()">
${msg}
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:45%">
   <tr>
    <td colspan="2">
       <font color="#000000" size="5px"> 文章${empty param.aab801?'添加':'阅读' }</font>
    </td>
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
       <input type="submit"  class="btn btn-secondary  active"  name="next" value="返回" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </c:if>
 <!-- 管理员可见的两个按钮 -->
		<c:if test="${aab108==2}">
			<input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/adminQueryArticle.html"
              formnovalidate="formnovalidate">
			<input type="submit" class="btn btn-secondary  active" name="pass" value="审核通过"
					formaction="<%=path%>/passArticle.html"
					formnovalidate="formnovalidate">
			<input type="submit" class="btn btn-secondary  active" name="unpass" value="审核不通过"
					formaction="<%=path%>/unpassArticle.html"
					formnovalidate="formnovalidate">
		</c:if>
		<c:if test="${aab101 !=null }">
 						<input type="button" class="btn btn-secondary  active" value="打赏" 
				       onclick="reward('${param.aab801 }','${ins.aab101}')"
				            formnovalidate="formnovalidate" >
				            </c:if>
				         <c:if test="${aab101 ==null }">
 						<input type="button" class="btn btn-secondary  active" value="打赏" 
				       		formaction = "login.html"
				            formnovalidate="formnovalidate" >
				            </c:if>   
     </td>
   </tr>
   		<input type="hidden" name="aab801" value="${ins.aab801 }">
   		<input type="hidden" name="aab101" value="${aab101 }">
</table>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
<script>
function reward(vaab801,paab101)
{	
	 var vform = document.getElementById("myform");

	 vform.action="<%=path%>/rewardForArticle.html?paab101="+paab101;

	 //alert(vform.action);
	 vform.submit();
}
</script>
</body>
</html>