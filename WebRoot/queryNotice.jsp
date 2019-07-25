<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

<link rel="shortcut icon" href="ico/favicon.ico" />
   <title>�ҵ���Ϣ</title>
   <style type="text/css">
   .maindiv{
  
   padding-left:300px;
   padding-right:300px;
   padding-top:50px;

   
   }
   
    .background{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background: url(images/backgrounds/Ursa.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }

.blockquote{
padding-left:10px;
padding-right:10px;
padding-top:5px;
}
.noticebar1{
background:rgba(252,248, 227, 0.9);
position:relative;
left:10px;
top:5px;
}
.noticebar1:hover{
background:rgba(252,248, 227, 1);
position:relative;
left:0px;
top:5px;
}
.noticebar2{
background:rgba(254,253, 207, 0.9);
position:relative;
left:10px;
top:5px;
}
.noticebar2:hover{
background:rgba(254,253, 207, 1);
position:relative;
left:0px;
top:5px;

}
m{background: #FBB985;
text-color:black;}
   </style>
</head>
<body onload="imgOnLoad('Ursa','jpg');pageOnLoad()">
<!-- ����ͷ�������� -->



<%@ include file="header.jsp" %>

<div class="maindiv">
<div  style="position:relative;left:40px;top:-30px;">

 	<img id="havatar" class="pico" src="images/others/mail.jpg" onclick="toNotice()" style="height:50px;width:50px;border-radius:50%" >

 	<p class="h4" style="color:#F3F197;position:absolute;top:9px;left:53px">�ҵ���Ϣ</p>
</div>
   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="15">
		     	<c:if test="${aab101==ins.aab101}">
	    	   	<ul>
	    	   	<c:if test="${vs.count%2==0 }">
	    	   	<div  class="noticebar2" >
	    	   
	    	   	    <c:if test="${ins.aad604==0 }">
	    	   	      <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count + (rows[0].nowFloor-1)*15} ${ins.aad602 }</p>
				  <footer class="blockquote-footer text-right">${ins.aad603 }</footer>
				</blockquote>
	    	   	   <hr>
				   
				    </c:if>
				
				  
				     <c:if test="${ins.aad604==1 }">
				   	 <blockquote class="blockquote text-left">
				  <p class="mb-0"><del> ${vs.count + (rows[0].nowFloor-1)*15} ${ins.aad602 }</del></p>
				  <footer class="blockquote-footer text-right ">${ins.aad603 }</footer>
				    	</blockquote>
				     <hr>
				    </c:if>
				   
				    </div>
				    </c:if>
				<c:if test="${vs.count%2==1 }">
	    	   	<div class="noticebar1">
	    	   	    <c:if test="${ins.aad604==0 }">
	    	   	      <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count + (rows[0].nowFloor-1)*15} ${ins.aad602 }</p>
				  <footer class="blockquote-footer text-right">${ins.aad603 }</footer>
				</blockquote>
	    	   	   <hr>
				   
				    </c:if>
				     <c:if test="${ins.aad604==1 }">
	    	   	 <blockquote class="blockquote text-left">
				  <p class="mb-0"><del>${vs.count + (rows[0].nowFloor-1)*15} ${ins.aad602 }</del></p>
				  <footer class="blockquote-footer text-right ">${ins.aad603 }</footer>
				    	</blockquote>
				     <hr>
				    </c:if>
				    </div>
				    </c:if>
				
				   </ul>
				   </c:if>
		      </c:forEach>
		    
		
	     </c:when>
	
	   </c:choose>
	   <form id="myform" action="<%=path%>/queryNotice.html" method="post">
	   <div align="center">
					<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
					</div>
<input type="text" hidden="true" name="aab101" id="aab101" value="<%=aab101%>">
</form>

</div>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>