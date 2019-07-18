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
<%@ include file="header.jsp" %>
${msg }
<div class="demoEvent" style="opacity: 0.9"></div>
<br>
<br>
<form id="myform" action="<%=path%>/queryEvent.html" method="post">
  <!-- 查询条件区 -->
	<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:85%">
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>赛事名</td>
	    <td>
	      <e:text name="qaac702"/>
	    </td>
	  </tr>	 
	</table>
	<!-- 数据迭代区 -->
	<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:85%">
	  <tr>
	    <td>序号</td>
	    <td>赛事名</td>
	    <td>赛事级别</td>
	    <td>赛事总奖金</td>
	    <td>赛事开放时间</td>
	    <td>赛事结束时间</td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td style="width:15%; height:15%">${vs.count }</td>
				    <td >
				      <!-- #  空锚 -->
				     <a  href="#" onclick="onEdit('${ins.aac701}')">${ins.aac702 }</a>
				    </td> 
				    <td>${ins.aac703 }</td>
				    <td>${ins.aac704 }</td>
				    <td>${ins.aac705 }</td>
				    <td>${ins.aac706 }</td>
				    <c:if test="${aab108==2}">  
				    <td>
				      <a href="#" onclick="onModify('${ins.aac701}')">修改</a>
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
	<table border="0" cellpadding="0" cellspacing="0" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="查询">
	        <c:if test="${aab108==2}">  
	       <input type="submit"class="btn btn-secondary  active"  name="next" value="添加" 
	       formaction="<%=path%>/addEvent.jsp">   
	       </c:if>
	    </td>
	  </tr>
	</table>
</form>
</body>
<script type="text/javascript">
      function onEdit(vaac701)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEvent.html?aac701="+vaac701;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onModify(vaac701)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEvent2.html?aac701="+vaac701;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>