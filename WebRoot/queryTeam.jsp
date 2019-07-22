<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>查看战队信息</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="demoTeam" style="opacity: 0.9"></div>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryTeam.html" method="post">
  <!-- 查询条件区 -->
	<table  align="center" class="table table-striped" style="background-color:#EEEEEE;opacity: 0.9;width:35%">
	
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>战队名</td>
	    <td>
	      <e:text name="qaac902"/>
	    </td>
	  </tr>	 
	</table>
	<!-- 数据迭代区 -->
	<table align="center" class="table table-striped" style="background-color:#EEEEEE;opacity: 0.9;width:35%">
	  <tr>
	    <td>序号</td>
	    <td>战队图像</td>
	    <td align="center">战队名</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td style="width:15%; height:15%">${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac903 } style="width:100%; height:100%">
				     </td>
				    <td align="center">
				      <!-- #  空锚 -->
				     <a  href="#" onclick="onEdit('${ins.aac901}')">${ins.aac902 }</a>
				    </td>   
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            
			          		            
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="11">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             
	                           
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- 功能按钮区 -->
	<table  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="查询">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="添加" 
	              formaction="<%=path%>/addTeam.jsp">
	        </c:if>
	         <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="上一页">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="下一页">
					<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
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