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
<br>
<form id="myform" action="<%=path%>/queryPlayer.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="35%" align="center">
	  <caption>
	            选手信息
	    <hr width="160">
	  </caption>
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
	<table border="1" width="35%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>选手头像</td>
	    <td>选手名</td>
	    <td></td>
	    <td></td>
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac1001 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:100%; height:100%">
				     </td>
				    <td>
				      <!-- #  空锚 -->
				     <a href="#" onclick="onEdit('${ins.aac1001}')">${ins.aac1002 }</a>
				    </td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aac1001}')">删除</a>
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
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" onclick="back()" value="查询">
	       <input type="submit" name="next" value="添加" 
	              formaction="<%=path%>/addPlayer.jsp">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delPlayer.html"  disabled="disabled">
	               <input type="button" onclick="onBack()" id="backFloor" value="上一页">
					<input type="button" onclick="onNext()" id="nextFloor" value="下一页">
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