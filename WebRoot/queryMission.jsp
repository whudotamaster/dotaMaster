<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
   <title>今日可完成的任务</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   

</head>
<body>
${msg }
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<br>
<br>
    
<form id="myform" action="<%=path%>/queryMission.html" method="post">
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>任务名称</td>
	    <td>任务描述</td>
	    <td>奖励经验</td>
	    <td>奖励经验</td>
	    <td>完成状态</td>
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
				    <td>${ins.aab902 }</td>
				    <td>${ins.aab903 }</td>
				    <td>${ins.aab904 }</td>
				    <td>${ins.aab905 }</td>
				      <td>
				      <c:if test="${ins.aab1002==0}"><font color="green">可完成！</font></c:if>
				       <c:if test="${ins.aab1002==1}"><font color="red">已完成！</font></c:if>
				      </td>
				   </tr>
		      </c:forEach>
		     
	     </c:when>
	   
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	
	
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="刷新">
	        <input type="submit" id="del" name="next" value="返回主页" 
	              formaction="<%=path%>/mainPage.jsp">
	        
	    </td>
	  </tr>
	</table>
		<input type="hidden" name="aab101" value="<%=aab101%>">
</form>


<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>

</body>

</html>