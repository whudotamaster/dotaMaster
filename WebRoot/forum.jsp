<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
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
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?aab101="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delPost.html?aab501="+vaab501;
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
				员工管理
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
				<td>性别</td>
				<td><e:radio name="aab506" value="普通区:0,精华区:1" defval="0" /></td>
			</tr>

		</table>
		<!-- 数据迭代区 -->
		<table border="1" width="95%" align="center">
			<tr>
				<td></td>
				<td>帖标题</td>
				<td>发帖人</td>
				<td>楼层数</td>
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
							<td><input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
							</td>
							<td>${ins.aab502 }</td>
							<td>
								<!-- #  空锚 --> <a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<td><a href="#" onclick="onDel('${ins.aab501}')">删除</a></td>
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
					<input type="submit" name="next" value="添加"
					formaction="<%=path%>/addEmp.jsp"> 
					<input type="submit"
					id="del" name="next" value="加精" formaction="<%=path%>/goodPost.html"
					disabled="disabled"></td>
			</tr>
		</table>
	</form>
</body>
</html>