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
<div class="demoEquipment" style="opacity: 0.9"></div>
<br>


<br>
<form id="myform" action="<%=path%>/queryEquipment.html" method="post">
  <!-- 查询条件区 -->
	<table align="center" class="table table-striped" style="background-color:#C0C2B8;opacity: 0.9;width:55%">

	 
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>装备名</td>
	    <td>
	      <e:text name="qaac502"/>
	    </td>
	  </tr>
	 

	</table>
	<!-- 数据迭代区 -->
	<table align="center" class="table table-striped" style="background-color:#C0C2B8;opacity: 0.9;width:55%">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>装备图像</td>
	    <td>装备名</td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac501 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac505 } style="width:100%; height:100%">
				     </td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" onclick="onEdit('${ins.aac501}')">${ins.aac502 }</a>
				    </td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aac501}')">删除</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
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
	        <c:forEach begin="1" step="1" end="11">
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
	<table  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active"  name="next" onclick="back()" value="查询">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="添加" 
	              formaction="<%=path%>/addEquipment.jsp">
	       <input type="submit" id="del" class="btn btn-secondary  active" name="next" value="删除" 
	              formaction="<%=path%>/delEquipment.html"  disabled="disabled">
	        </c:if>
	         <input type="button" onclick="onBack()" class="btn btn-secondary  active" id="backFloor" value="上一页">
		     <input type="button" onclick="onNext()" class="btn btn-secondary  active" id="nextFloor" value="下一页">
			 <input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
			 <e:hidden name="floor" defval="${rows[0].floor }"/>
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
      
      function onEdit(vaac501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEquipment.html?aac501="+vaac501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaac501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdEquipment.html?aac501="+vaac501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>