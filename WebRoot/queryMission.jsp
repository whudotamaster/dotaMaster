<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<link rel="shortcut icon" href="ico/favicon.ico" />
   <title>今日可完成的任务</title>
   <style type="text/css">
   

   </style>
       <link href="css/pricing.css" rel="stylesheet">
   
</head>
<body onload="imgOnLoad('TideHunter','jpg');pageOnLoad()">
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<div class="background"></div>
 <div class="container" style="z-index:2;" >
      <div class="card-deck mb-3 text-center">
      	   <c:choose>
	     <c:when test="${rows!=null }">
	     
	   
		     <c:forEach items="${rows }" var="ins" >
		     
	    	   <div class="card mb-4 box-shadow" style="background:#F6F6F6;opacity:0.9" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="#272636">${ins.aab902 }</font></h4> 
          </div>
          <div class="card-body">
         <c:if test="${ins.aab1002==0}">
          
     		<img id="havatar" src="images/others/uncomplete.jpg" style="height:120px;width:120px;"  >
     		</c:if>
     		        <c:if test="${ins.aab1002==1}">
          
     		<img id="havatar" src="images/others/complete.jpg" style="height:120px;width:120px;"  >
     		</c:if>
            <font color="#272636"><h5 class="card-title pricing-card-title">${ins.aab903 }</h5> 
            <h5><small class="text-muted">Exp:${ins.aab904 }|M点:${ins.aab905 }</small></h5></font>
          </div>
        </div>
	    	  
		      </c:forEach>
		      	   <div class="card mb-4 box-shadow" style="background:#F6F6F6;opacity:0.9" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="#272636">${aab102 }</font></h4> 
          </div>
          <div class="card-body">
        
          
     		<img id="havatar" src="/Avatar/${pic}" class="pico" onclick="toUpdate()"style="height:120px;width:120px;border-radius: 50%"  >
     	
            <font color="#272636"><h5 class="card-title pricing-card-title"><br>会员到期时间<br>${aab109 }</h5> </font>
            
          </div>
        </div>
	     </c:when>
	   </c:choose>
         
         
      </div>
      
</div>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>