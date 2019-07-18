<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
<style>
tr {
	height: 25px;
}
</style>
<title>查看${qins.aab102}的信息</title>
</head>
<body>
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>

<br>
<form action="<%=path%>/updtPsnInf.html" method="post" id="myform">
<table border="1" align="center" width="45%">
  <caption>

       修改我的信息
  
 
       <hr width="160">
  </caption>
	 <tr>
	     <td colspan="2">${qins }</td>
	 </tr>
	  <tr>
	     <td colspan="2">${msg }</td>
	 </tr>
	 <tr>
	 	<td>昵称</td>
	 	<td>
	 	   <e:text name="aab102" required="true" autofocus="true" readonly="true" defval="${qins.aab102 }" /> 
	 	</td>
	 </tr>
	  <tr>
	 	<td>头像</td>
	 	<td>
 	      <img id="avatar" src="/Avatar/${qins.aab105 }" style="height:200px;width:200px;" >
 	  	</td>
		</tr>
	 <tr>
	 
	 <td>当前经验值</td>
	 	<td>
 	       <e:text name="aab107" required="true" readonly="true" defval="${qins.aab107 }"/> 
	 	</td>
	 </tr>
</table>
<!-- 数据迭代区 -->
		<table border="1" width="95%" align="center">
			<tr>
				
				<td>帖标题</td>
				<td>回复数</td>
				<td>发帖时间</td>
		
			</tr>
			<!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
			<c:choose>
				<c:when test="${rows!=null }">
					<!-- 显示实际查询到的数据 -->
					<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							
								<td>
							<!-- #  空锚 --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							
						</tr>
					</c:forEach>
					<!-- 补充空行 -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
						<tr>
						
							<td></td>
							<td></td>
						
							<td></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="1" step="1" end="15">
						<tr>
						
							<td></td>
							<td></td>
							
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>









 <input type="submit" name="Submit" formaction="<%=path%>/forum.html"  formnovalidate="formnovalidate" onclick="back()" value="返回论坛">

 <input type="submit" name="Submit" formaction="<%=path%>/mainPage.jsp"  formnovalidate="formnovalidate" value="返回主页">
</form>

	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
    <script>
    function onVisit(vaab501)
    {
  	 
  		 var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
      	 //alert(vform.action);
      	 vform.submit();
  	
    }
    </script>
</html>