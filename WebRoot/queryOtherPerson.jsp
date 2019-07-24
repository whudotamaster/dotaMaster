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
<title>�鿴${qins.aab102}����Ϣ</title>
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
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
  <div class="container k" >
 
      <div class="py-5 text-center">
        <img id="avatar" src="/Avatar/${qins.aab105 }"  style="height:200px;width:200px;border-radius:50%" >
        <h2>${qins.aab102 }</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4" style="color:#000;">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">���Ԥ������</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���1</h6>
                <small class="text-muted">��������1</small>
              </div>
              <span class="text-muted">�۸�1</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���2</h6>
                <small class="text-muted">��������2</small>
              </div>
              <span class="text-muted">�۸�2</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���3</h6>
                <small class="text-muted">��������3</small>
              </div>
              <span class="text-muted">�۸�3</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���4</h6>
                <small class="text-muted">��������4</small>
              </div>
              <span class="text-muted">�۸�4</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���5</h6>
                <small class="text-muted">��������5</small>
              </div>
              <span class="text-muted">�۸�5</span>
            </li>
          </ul>
         </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">�û� ${qins.aab102} ����Ϣ</h4>
         
        
                     <hr class="mb-4">  
      	 <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">��ǰ����ֵ��</label>
                 <a><br>${qins.aab107 }</a>
              </div>
               <div class="col-md-6 mb-3">
                <label for="firstName">��ǰ�ȼ���</label>
                <br>
               <fmt:formatNumber value="${(qins.aab107-qins.aab107%100)/100 }" pattern="#" type="number"/>
              </div>
          </div>
       
              <hr class="mb-4">  
              <div class="row">
              	 <div class="col-md-6 mb-3">
             	    <form method="post">
                		 <button class=" btn btn-primary btn-lg btn-block " type="submit" style="width:200px" formaction="<%=path%>/forum.html"  >������̳</button>
					</form>
                 </div>
              </div>
              
        </div>
        
          <div class="col-md-8 order-md-1" ">
          <h4 class="mb-3">�û� ${qins.aab102} ����ʷ����</h4>
                  <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	<ul>
	    	   	<c:if test="${vs.count%2==0 }">
	    	   	<div  class="noticebar2" onclick="onVisit('${ins.aab501 }')" >
	    	   	   
	    	   	      <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count} |�ظ��� ${ins.aab505 } | ${ins.aab502 }</p>
				  <footer class="blockquote-footer text-right">${ins.aab504 }</footer>
				</blockquote>
	    	   	   <hr>
				   
				    </div>
				    </c:if>
				<c:if test="${vs.count%2==1 }">
	    	   	<div class="noticebar1" onclick="onVisit('${ins.aab501 }')">
	    	   
	    	   	        <blockquote class="blockquote text-left" >
				  <p class="mb-0">${vs.count} |�ظ��� ${ins.aab505 } | ${ins.aab502 }</p>
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
	<!-- ����ҳ�� -->
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