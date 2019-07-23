<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>查看选手信息</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
</head>
<body onload="imgOnLoad('PlayerBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryPlayer.html" method="post">
  <!-- 查询条件区 -->
	<table align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:55%">
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>选手名</td>
	    <td>
	      <e:text name="qaac1002"/>
	    </td>
	  </tr>	 
	</table>
	<!-- 数据迭代区 -->
	<table align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:55%">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>选手头像</td>
	    <td>选手名</td>
	    <td></td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				    <c:if test="${aab108==2}">
				      <input type="checkbox" name="idlist" value="${ins.aac1001 }"
				             onclick="onSelect(this.checked)" >
				             </c:if>
				    </td>
				    <td>${vs.count }</td>
				     <td  >
				       <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:30%; height:100%">
				     </td>
				    <td>
				      <!-- #  空锚 -->
				     <a href="#" style="color:black" onclick="onEdit('${ins.aac1001}')">${ins.aac1002 }</a>
				    </td>
				     <c:if test="${aab108==2}">
				    <td>
				      <a href="#" style="color:black" onclick="onDel('${ins.aac1001}')">删除</a>
				    </td>
				    </c:if>
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
	       <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="查询">
	        <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="添加" 
	              formaction="<%=path%>/addPlayer.jsp">
	       <input type="submit" class="btn btn-secondary  active" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delPlayer.html"  disabled="disabled">
	       </c:if>
	        <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="上一页">
		    <input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="下一页">
			<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
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
      
      function onEdit(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>