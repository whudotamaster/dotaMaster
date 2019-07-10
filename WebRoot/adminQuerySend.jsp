<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); 
String aab108=(String)session.getAttribute("aab108");%>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   
   <script type="text/javascript">    
      function onEdit(vaad401)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findSendAcc.html?aad401="+vaad401;
    	 vform.submit();
      }

   </script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" method="post">
	<!-- 数据迭代区 -->
	
	<table border="1" width="95%" align="center">
	 <caption>
	       <%=aab108.equals("1")?"查看历史购买":"查看待发货列表"%>
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>序号</td>
	    <td>饰品名称</td>
	    <td>价格</td>
	    <td>玩家编号</td>
	    <td>交易时间</td>
	    <td>留言</td>
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
				      <a href="#" onclick="onEdit('${ins.aad401 }')">${vs.count }</a>
				    </td>
				    <td>${ins.aac602 }</td>
				    <td>${ins.aac605 }</td>
				    <td>${ins.aad402 }</td>
				    <td>${ins.aad405 }</td>
				    <td>${ins.aad404 }</td>
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
	    <td align="center">
	       <input type="submit" name="next" value="<%=aab108.equals("1")?"查看历史购买":"查看待发货列表"%>"
              formaction="<%=path%>/<%=aab108.equals("1")?"queryBuyOrder.html":"querySendAcc.html"%>">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="1">
</form>
</body>
</html>