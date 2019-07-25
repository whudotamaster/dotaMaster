<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>处理申诉</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
tr {
	height: 25px;
}
}
</style>
</head>

<body onload="imgOnLoad('dota2','png');pageOnLoad()">

<%@ include file="header.jsp" %>

<font color="white">

</font>
<br>
<br>

		<form id="myform" action="<%=path%>/adminQueryComp.html" method="post">	<!-- 数据迭代区 -->
	
	<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.9;width:90%">
	   <caption align="left"><font color="white" size="5px">待处理申诉</font> </caption>
		<tr>
			<td>序号</td>
			<td>投诉标题</td>
			<td>投诉用户</td>
			<td>投诉内容</td>
			<td>提交时间</td>
			<td colspan="2">处理操作</td>
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
						<c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="15">
							<tr>

								<td>${vs.count + (rows[0].nowFloor-1)*15}</td>
								<td><a href="#" onclick="onEdit('${ins.aad501}')">${ins.aad502}</a>
								</td>
								<td>${ins.aab102 }</td>
								<td>${ins.aad503 }</td>
								<td>${ins.aad505 }</td>
								<td><a href="#" onclick="onDone('${ins.aad501}')">处理完成</a>
								</td>
								<td><a href="#" onclick="onUndone('${ins.aad501}')">无法处理</a>
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
								<td></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
	</table>
	<!-- 功能按钮区 -->
	   <div align="center">
					<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="上一页">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="下一页">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
					</div>
	<input type="hidden" name="aab101" value="${aab101} ">
</form>
<%@include file="footer.jsp" %>

</body>
<script type="text/javascript">
      var count=0;      
      function onEdit(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      function onDone(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/doneByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      function onUndone(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/undoneByIdComplain.html?aad501="+vaad501;
    	 vform.submit();
      }
      
   }
   </script>
</html>