<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>处理申诉</title>
<style type="text/css">
tr {
	height: 25px;
}


}
</style>
</head>
<body>
	${msg }
	<!-- 引入头部导航栏 -->
	<%@ include file="header.jsp"%>
	<c:if test="${aab108==2}">
		<form id="myform" action="<%=path%>/adminQueryComp.html" method="post">
			<!-- 查询条件区 -->

      <center>待处理申诉</center>
	    <hr width="160">
	 

	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>投诉标题</td>
	    <td>用户ID</td>
	    <td>投诉内容</td>
	    <td>提交时间</td>
	    
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
				   
				    <td>${vs.count }</td>
				    <td>
				      <a href="#" onclick="onEdit('${ins.aad501}')">${ins.aad502}</a>
				    </td>
				    <td>${ins.aab101 }</td>
				    <td>${ins.aad503 }</td>
				    <td>${ins.aad505 }</td>
			
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
	         <input type="submit" id="ref" name="next" value="刷新" 
	              formaction="<%=path%>/adminQueryComp.html">     
	            <input type="submit" id="del" name="next" value="返回" 
	              formaction="<%=path%>/adminGo.jsp">        
	    </td>
	  </tr>
	</table>
</form>
</c:if>

<%@include file="footer.jsp" %>
<!-- 引入页脚 -->
</body>
   <script type="text/javascript">
      var count=0;
     
      
      function onEdit(vaad501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdComplaint.html?aad501="+vaad501;
    	 vform.submit();
      }
      

      
   </script>
</html>