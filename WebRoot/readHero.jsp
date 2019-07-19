<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
td {
	height: 30px;
}

msg {
	color: #FF0000
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="demo" style="opacity: 0.9"></div>
	${msg}
	<br>
	<br>
	<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
		<table align="center" class="table table-striped" style="background-color:#FFFFFF;opacity: 0.9;width:45%">
		  <tr>
			<td>
				英雄详细信息浏览
			</td>
			</tr>
			<tr>
				<td colspan="2">英雄</td>
			</tr>
			<tr>
				<td>英雄名</td>
				<td><e:text name="aac102" readonly="readonly" required="true"
						defval="${rows[0].aac102 }" /></td>
			</tr>
			<tr>
				<td>英雄图像</td>
				<td><img alt="no image" src=<%=path%>/images/${rows[0].aac112 } style="width: 12%; height: 100%">
				</td>
			</tr>
			<tr>
			<tr>
			<td></td>
			</tr>
			<tr>
				<td colspan="2">技能</td>
			</tr>
			<c:choose>
				<c:when test="${rows2!=null }">
					<!-- 显示实际查询到的数据 -->
					<c:forEach items="${rows2 }" var="ins" varStatus="vs">
						<tr>
							<td>技能图像</td>
							<td><img alt="no image" src=<%=path%>/images/${ins.aac306 } style="width: 12%; height: 100%">
							</td>
						</tr>
						<tr>
							<td>技能名</td>
							<td><e:text name="aac302" readonly="readonly"
									defval="${ins.aac302 }" /></td>
						</tr>
						<tr>
							<td>技能描述</td>
							<td><e:text name="aac303" readonly="readonly"
									defval="${ins.aac303 }" /></td>
						</tr>
						<tr>
							<td>冷却</td>
							<td><e:text name="aac304" readonly="readonly"
									defval="${ins.aac304 }" /></td>
						</tr>
						<tr>
							<td>耗蓝</td>
							<td><e:text name="aac305" readonly="readonly"
									defval="${ins.aac305 }" /></td>
						</tr>
						<tr>
						<td></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			<tr>
				<td colspan="2">天赋</td>
			</tr>
			<c:choose>
				<c:when test="${rows!=null }">
					<!-- 显示实际查询到的数据 -->
					<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							<td>天赋等级</td>

							<td><e:text name="aac202" readonly="readonly"
									defval="${ins.aac202 }" /></td>
						</tr>
						<tr>
							<td>天赋描述</td>
							<td><e:text name="aac203" readonly="readonly"
									defval="${ins.aac203 }" /></td>
						</tr>
						
						<tr>
						<td></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>

			<tr>
				<td colspan="2" align="center">
				<input type="submit" name="next" class="btn btn-secondary  active"
					value="返回" formaction="<%=path%>/queryHero.html"
					formnovalidate="formnovalidate">
					</td>
			</tr>
		</table>
		<input type="hidden" name="aac901" value="${param.aac101 }">
	</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    
      function onEdit(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>
</html>