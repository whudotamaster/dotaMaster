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
<form id="myform" action="<%=path%>/queryEvent.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="35%" align="center">
	  <caption>
	            赛事信息
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>赛事名</td>
	    <td>
	      <e:text name="qaac902"/>
	    </td>
	  </tr>	 
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>赛事名</td>
	    <td>赛事级别</td>
	    <td>赛事总奖金</td>
	    <td>赛事开放时间</td>
	    <td>赛事结束时间</td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td style="width:15%; height:15%">${vs.count }</td>
				    <td align="center">
				      <!-- #  空锚 -->
				     <a  href="#" onclick="onEdit('${ins.aac701}')">${ins.aac702 }</a>
				    </td> 
				    <td>${ins.aac703 }</td>
				    <td>${ins.aab704 }</td>
				    <td>${ins.aab705 }</td>
				    <td>${ins.aab706 }</td>  
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
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加" 
	       formaction="<%=path%>/addTeam.jsp">
	      
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
      
      function onEdit(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>