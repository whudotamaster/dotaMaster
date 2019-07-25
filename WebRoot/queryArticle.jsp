<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>查询文章</title>
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
<form id="myform" action="<%=path%>/queryArticle.html" method="post">
  <!-- 查询条件区 -->
	<table align="center" class="table table-striped" style="background-color:#CCDDFF;opacity: 0.9;width:85%">
	  
	  </caption>
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
	<table align="center" class="table table-striped" style="background-color:#CCDDFF;opacity: 0.9;width:85%">
	  <tr>
	  
	    <td>序号</td>
	    <td>文章标题</td>
	    <td>用户</td>
	    <td>发布时间</td>
	
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
				
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  空锚 -->
				      <a style="color:#D5A5D9" href="#" onclick="onEdit('${ins.aab801}')">${ins.aab802 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab805 }</td>
				 
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
			          <tr>
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
	                   
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="0" cellpadding="0" cellspacing="0"  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="文章查询">
	       
	        <c:if test="${aab108!=null}">
	       		<input type="submit" class="btn btn-secondary  active" name="next" value="我要投稿" 
	              formaction="<%=path%>/addArticle.jsp">
	     	</c:if>
	     	 <c:if test="${aab108==null}">
	       		<input type="submit" class="btn btn-secondary  active" name="next" value="我要投稿" 
	              formaction="<%=path%>/login.jsp">
	     	</c:if>
	             <c:if test="${aab108==2}">
					<input type="submit" onclick="back()"  class="btn btn-secondary  active" formaction="<%=path%>/adminQueryArticle.html" value="审核">
	        	</c:if>
	        <input type="button" onclick="onBack()" class="btn btn-secondary  active" id="backFloor" value="上一页">
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
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>