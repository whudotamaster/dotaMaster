<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
${msg }
<%@ include file="header.jsp" %>
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryHero.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               英雄查询
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>英雄名</td>
	    <td>
	      <e:text name="qaac102"/>
	    </td>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>英雄图像</td>
	    <td>英雄名</td>
	    <td>力量成长</td>
	    <td>敏捷成长</td>
	    <td>智力成长</td>
	    <td>初始血量</td>
	    <td>初始蓝量</td>
	    <td>移速</td>
	    <td>初始力量</td>
	    <td>初始敏捷</td>
	    <td>初始智力</td>
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
				      <input type="checkbox" name="idlist" value="${ins.aac101 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td style="width:5%; height:5%">
				       <a href="#" onclick="onRead('${ins.aac101}')">
				        <img alt="no image" src=<%=path%>/images/${ins.aac112 }></a>
				     </td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" onclick="onEdit('${ins.aac101}')">${ins.aac102 }</a>
				    </td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				    <td>${ins.aac106 }</td>
				    <td>${ins.aac107 }</td>
				    <td>${ins.aac108 }</td>
				    <td>${ins.aac109 }</td>
				    <td>${ins.aac110 }</td>
				    <td>${ins.aac111 }</td>
				    <c:if test="${aab108==2}">
				    <td>
				      <a href="#" onclick="onDel('${ins.aac101}')">删除</a>
				    </td>
				    </c:if>
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
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加" 
	              formaction="<%=path%>/addHero.jsp">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delHero.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdHero.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onRead(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdHeroFM.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdHero.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>