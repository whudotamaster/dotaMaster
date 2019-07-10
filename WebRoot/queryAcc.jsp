<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
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
      
      function onEdit(vaac601,param)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdAcc.html?aac601="+vaac601+"&param="+param;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onModify(vaac601,param)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdAcc.html?aac601="+vaac601+"&param="+param;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdAcc.html?aac601="+vaac601;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body>
${msg }
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryAcc.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="35%" align="center">
	  <caption>
	            饰品
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>饰品名</td>
	    <td>
	      <e:text name="qaac602"/>
	    </td>
	  </tr>
	 

	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>饰品图像</td>
	    <td>饰品名</td>
	    <td></td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac601 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:100%; height:100%">
				     </td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" onclick="onEdit('${ins.aac601}',1)">${ins.aac602 }</a>
				    </td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aac601}')">删除</a>
				    </td>
				    <td>
				      <a href="#" onclick="onModify('${ins.aac601}',2)">修改</a>
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
	              formaction="<%=path%>/addAcc.jsp">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delAcc.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>