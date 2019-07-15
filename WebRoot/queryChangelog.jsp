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
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryChangelog.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="35%" align="center">
	  <caption>
	                更新日志
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>更新版本号</td>
	    <td>
	      <e:text name="qaac1202"/>
	    </td>
	  </tr>	 
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>更新版本号</td>
	    <td>更新时间</td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac1201 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  空锚 -->
				     <a href="#" onclick="onEdit('${ins.aac1201}')">${ins.aac1202 }</a>
				    </td>
				     <td>${ins.aac1204 }</td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
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
	             
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- 功能按钮区 -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <c:if test="${aab108==2}">
	       <input type="submit" name="next" value="添加" 
	              formaction="<%=path%>/addChangelog.jsp">
	       </c:if>
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
      
      function onEdit(vaac1201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdChangelog.html?aac1201="+vaac1201;
    	 //alert(vform.action);
    	 vform.submit();
      }   
  
   </script>  
</html>