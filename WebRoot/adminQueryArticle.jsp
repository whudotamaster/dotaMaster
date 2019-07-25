<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
   <title>管理员审核文章</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   <style type="text/css">
     tr
     {
        height:50px;
     }
   </style>
   

</head>
<body onload="imgOnLoad('ta','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<!-- 引入头部导航栏 -->
<br>
<br>
    <c:if test="${aab108==2}">
<form id="myform" action="<%=path%>/adminQueryArticle.html" method="post">
  <!-- 查询条件区 -->
	<table align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:95%">
	<tr>
	   <td>
	       <font color="#000000" size="5px">文章审核</font>
	   </td>
	 </tr>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>文章名</td>
	    <td>
	      <e:text name="qaab802"/>
	    </td>
	</table>
	<!-- 数据迭代区 -->
	<table align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:95%">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>文章标题</td>
	    <td>用户</td>
	    <td>发布时间</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aab801 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" style="color:#D5A5D9" onclick="onEdit('${ins.aab801}')">${ins.aab802 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab805 }</td>
				    <td>
				      <a href="#" style="color:#D5A5D9"  onclick="onDel('${ins.aab801}')">删除</a>
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
	       <input type="submit" class="btn btn-secondary  active" name="next" value="查询">
	       
	       <input type="submit" class="btn btn-secondary  active" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delArticle.html"  disabled="disabled">
	             
	            <input type="submit" class="btn btn-secondary  active" id="del" name="next" onclick="back()" value="返回" 
	              formaction="<%=path%>/queryArticle.html">
	          <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="上一页">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="下一页">
					<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
</form>
</c:if>

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
      
      function onEdit(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdArticle.html?aab801="+vaab801;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdArticle.html?aab801="+vaab801;
    	 vform.submit();
      } 
  
   </script>
</html>