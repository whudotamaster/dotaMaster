<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="header.jsp" %>
<html>
<head>
   <title>公布比赛结果</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   <style type="text/css">
     tr
     {
        height:40px;
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
      
      function onBet(vaad101,vaac1101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/ModifyComp.html?aac1105="+vaad101+"&aac1101="+vaac1101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body onload="imgOnLoad('Lina2','jpg');pageOnLoad()">

<br>
<br>
<form id="myform" action="<%=path%>/queryComp.html" method="post">
	<!-- 数据迭代区 -->
	
<table align="center" class="table table-striped" style="background-color:#DCDCDC;opacity: 0.85;width:90%">
	   <caption align="left"><font color="white" size="5px">比赛</font> </caption>
	  <tr>
	    <td>序号</td>
	    <td>赛事</td>
	    <td>战队1</td>
	    <td>战队2</td>
	    <td>比赛开始时间</td>
	    <td></td>
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
			
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>${ins.aac1103 }</td>
				    <td>${ins.aac1104 }</td>
				    <td>${ins.aac1102 }</td>
				    <td>
				      <a href="#" onclick="onBet('1','${ins.aac1101}')">战队1获胜</a>
				    </td>
				    <td>
				      <a href="#" onclick="onBet('2','${ins.aac1101}')">战队2获胜</a>
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
	<table align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="查询">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>