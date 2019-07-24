<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style>
tr {
	height: 25px;
}
</style>
<title>查看${qins.aab102}的信息</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
 <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
    <style type="text/css">
    
            
            .k{
            color:#FFFFFF;
            background-color:rgba(0,0,0,0.5);
           }
    .noticebar1{
 color:#000;
background:rgba(255,255, 255, 0.8);
position:relative;
left:10px;
top:5px;
}
.noticebar1:hover{
background:rgba(255,255, 255, 1);
position:relative;
left:0px;
top:5px;
}
.noticebar2{
 color:#000;
background:rgba(255,255, 255, 0.9);
position:relative;
left:10px;
top:5px;
}
.noticebar2:hover{
background:rgba(255,255, 255, 1);
position:relative;
left:0px;
top:5px;

}
    </style>

</head>
<body onload="imgOnLoad('DrowRanger','jpg');pageOnLoad()">
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
  <div class="container k" >
 
      <div class="py-5 text-center">
        <img id="avatar" src="/Avatar/${qins.aab105 }"  style="height:200px;width:200px;border-radius:50%" >
        <h2>${qins.aab102 }</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4" style="color:#000;">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">广告预留界面</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告1</h6>
                <small class="text-muted">宣传标语1</small>
              </div>
              <span class="text-muted">价格1</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告2</h6>
                <small class="text-muted">宣传标语2</small>
              </div>
              <span class="text-muted">价格2</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告3</h6>
                <small class="text-muted">宣传标语3</small>
              </div>
              <span class="text-muted">价格3</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告4</h6>
                <small class="text-muted">宣传标语4</small>
              </div>
              <span class="text-muted">价格4</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告5</h6>
                <small class="text-muted">宣传标语5</small>
              </div>
              <span class="text-muted">价格5</span>
            </li>
          </ul>
         </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">用户 ${qins.aab102} 的信息</h4>
         
        
                     <hr class="mb-4">  
      	 <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">当前经验值：</label>
                 <a><br>${qins.aab107 }</a>
              </div>
               <div class="col-md-6 mb-3">
                <label for="firstName">当前等级：</label>
                <br>
               <fmt:formatNumber value="${(qins.aab107-qins.aab107%100)/100 }" pattern="#" type="number"/>
              </div>
          </div>
       
              <hr class="mb-4">  
              <div class="row">
              	 <div class="col-md-6 mb-3">
             	    <form method="post">
                		 <button class=" btn btn-primary btn-lg btn-block " type="submit" style="width:200px" formaction="<%=path%>/forum.html"  >返回论坛</button>
					</form>
                 </div>
              </div>
              
        </div>
        
          <div class="col-md-8 order-md-1" ">
          <h4 class="mb-3">用户 ${qins.aab102} 的历史发帖</h4>
                  <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	<ul>
	    	   	<c:if test="${vs.count%2==0 }">
	    	   	<div  class="noticebar2" onclick="onVisit('${ins.aab501 }')" >
	    	   	   
	    	   	      <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count} |回复数 ${ins.aab505 } | ${ins.aab502 }</p>
				  <footer class="blockquote-footer text-right">${ins.aab504 }</footer>
				</blockquote>
	    	   	   <hr>
				   
				    </div>
				    </c:if>
				<c:if test="${vs.count%2==1 }">
	    	   	<div class="noticebar1" onclick="onVisit('${ins.aab501 }')">
	    	   
	    	   	        <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count} |回复数 ${ins.aab505 } | ${ins.aab502 }</p>
				  <footer class="blockquote-footer text-right">${ins.aab504 }</footer>
				</blockquote>
	    	   	   <hr>
				  
				    </div>
				    </c:if>
				
				   </ul>
		      </c:forEach>
	     </c:when>
	
	   </c:choose>
	   </div>
      </div>
   </div>
<br>
<form id="myform" name="myform" method="post"></form>
	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
    <script>
    function onVisit(vaab501)
    {
  	 
  		 var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
      	 //alert(vform.action);
      	 vform.submit();
  	
    }
    </script>
</html>