<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath();
String aab101=(String)session.getAttribute("aab101");
%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
tr {
	height: 25px;
}

.round_icon {
	width: 34px;
	height: 34px;
	display: flex;
	border-radius: 50%;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}
</style>

<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("delCollection");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDelCollection(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delCollectionByIdInQueryCollection.html?aab501="+vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body >
	${msg }
	<br>
	<%=session.getId() %>
	<br>
	<form id="myform" action="<%=path%>/forum.html" method="post">
		<!-- 查询条件区 -->
		<table border="1" width="95%" align="center">
			<caption>
				收藏页面
				<hr width="160">
			</caption>
		</table>
		<!-- 数据迭代区 -->
		<table border="1" width="95%" align="center">
			<tr>
				<td></td>
				<td>帖标题</td>
				<td>发帖人</td>
				<td>收藏时间</td>
				<td></td>
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
							<td><input type="checkbox" name="idlist"
								value="${ins.aab701 }" onclick="onSelect(this.checked)">
								</td>
								<td>
							<!-- #  空锚 --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>
								<!-- #  用户名及头像--> 
								<a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
							</td>
							<td>${ins.aab702 }</td>
							<td><a href="#" onclick="onDelCollection('${ins.aab501}')">删除</a></td>
						</tr>
					</c:forEach>
					<!-- 补充空行 -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
						<tr>
							<td></td>
							<td></td>
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
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 功能按钮区 -->
		<table border="1" width="95%" align="center">
			<tr>
				<td align="center">
				<input type="submit"
					id="delCollection" name="next" value="删除收藏" 
					disabled="disabled"
					formaction="<%=path%>/delCollection.html">
				  <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
					</td>
			</tr>
		</table>
		 <e:hidden name="aab101" defval="<%=aab101 %>"/>
	</form>
</body>
</html>