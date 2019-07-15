<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

</head>
<body >
	${msg }
<%@ include file="header.jsp" %>
	<br>
	<br>
	<form id="myform" action="<%=path%>/forum.html" method="post">
		<!-- 查询条件区 -->
		<table border="1" width="95%" align="center">
			<caption>
				论坛主页
				<hr width="160">
			</caption>
			<tr>
				<td colspan="4">查询条件</td>
			</tr>
			<tr>
				<td>标签名称</td>
				<td><e:text name="aab502" /></td>
			</tr>
			<tr>
				<td>区块</td>
				<td><e:radio name="aab506" value="普通区:0,精华区:1" defval="0" /></td>
				<td>
					<c:choose>
				<c:when test="<%= aab101!=null %>">
					<input type="submit"
					id="addPost" name="next" value="发帖" formaction="<%=path%>/addPostOnLoad.html">
				</c:when>
				<c:otherwise>
						<input type="submit"
					id="addPost" name="next" value="发帖" formaction="<%=path%>/login.html">
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<!-- 数据迭代区 -->
		<table border="1" width="95%" align="center">
			<tr>
				<td></td>
				<td>帖标题</td>
				<td>发帖人</td>
				<td>回复数</td>
				<td>时间</td>
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
						<td>
						<c:if test="${aab108 == 2 }">
							<input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
							</c:if>
							</td>
							<td>
							<!-- #  空锚 --> 
							<a href="#" onclick="onVisit('${ins.aab501 }')">${ins.aab502 }</a>
							</td>
							<td>
								<!-- #  用户名及头像--> 
								<a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<td>
							<c:if test="${aab108 == 2 || ins.aab101 == aab101}">
							<a href="#" onclick="onDel('${ins.aab501}')">删除</a>
							</c:if>
							</td>
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
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 功能按钮区 -->
		<table border="1" width="95%" align="center">
			<tr>
				<td align="center"><input type="submit" name="next" value="查询">
					<c:if test="${aab108 == 2 }">
					<input type="submit"
					id="goodPost" name="next" value="加精" formaction="<%=path%>/goodPost.html"
					disabled="disabled">
					</c:if>

					<c:if test="${ aab101 !=null }">
					<input type="submit"
					id="collectionPase" name="next" value="收藏页面" 
					formaction="<%=path%>/queryCollection.html">
					<input type="submit"
					id="historyPase" name="next" value="歷史發帖" 
					formaction="<%=path%>/queryHistoryById.html">
					</c:if>
					</td>
			</tr>
		</table>
		 <e:hidden name="aab101" defval="<%=aab101 %>"/>
	</form>
<%@include file="footer.jsp" %>
</body>
	<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("goodPost");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delPostById.html?aab501=" + vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 

   </script>
</html>