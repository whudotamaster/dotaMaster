<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
td {
	height: 30px;
}
  *{
      margin: 0;
      padding: 0;
    }

    .container{
      width: 100%;
      padding:20px;
    }
    .bigcontainer{
      width: 70%;
      border: 2px #D3D3D3  solid;
      margin:0 auto;
      background-color:white;	  
    }

msg {
	color: #FF0000
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="demo" style="opacity: 0.9"></div>
	${msg}
	
	<br>
	<br>
	<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
	<div class="bigcontainer" style="opactity:0.95">
		<div class="container">
			<div>
				<img alt="no image" src=<%=path%>/images/${ins.aac112 } style="width: 200px; height: 200px;">
			</div>
			<div>
				${ins.aac102 }
			</div>
		</div>
	
		<div class="container">
		  <br>
		  <font color=black size=5>技能:</font>
		  <br>
		  <br>
		  <div class="row">
		    <c:forEach items="${ins.rows2 }" var="ins" varStatus="vs">
		    <div class="col-sm">
		      <div><div title="${ins.aac303 }"><img alt="no image" src=<%=path%>/images/${ins.aac306 } style="width: 100px; height: 100px"></div></div>
		      <div><div title="${ins.aac303 }"><font color=black>${ins.aac302 }</font></div></div>  
		    </div>
		    </c:forEach>
		  </div>
		</div>
		
		<div class="container">
		  <br>
		  <font color=black size=5>饰品:</font>
		  <br>
		  <br>
		  <div class="row">
		    <c:forEach items="${ins.rows3 }" var="ins" varStatus="vs">
		    <div class="col-sm">
		      <div><img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width: 100px; height: 100px"></div>
		      <div><font color=black><a href="#" onclick="onEdit2('${ins.aac601}')">${ins.aac602 }</a></font></div>  
		    </div>
		    </c:forEach>
		  </div>
		</div>
	</div>
















	   <table width=100%>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" name="next" class="btn btn-secondary  active"
					value="返回" formaction="<%=path%>/queryHero.html"
					formnovalidate="formnovalidate">
					</td>
			</tr>
		</table>
		<input type="hidden" name="aac901" value="${param.aac101 }">
	</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    
      function onEdit(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onEdit2(vaac601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdAcc.html?aac601="+vaac601;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>
</html>