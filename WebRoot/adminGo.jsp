<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����</title>
    <link href="css/pricing.css" rel="stylesheet">

<style>
.a{
opacity:0.8;

}
.a:hover{
opacity:1;
}



</style>
<script type="text/javascript" src="jquery.js"></script>
</head>
<body style="background:url(images/AdminGo.jpg)">

<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<c:if test="${aab108==2}">
 <div class="container" >
      <div class="card-deck mb-3 text-center">
       <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">�汾����</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/XLZR.jpg" onclick="toHero()" style="height:150px;width:150px;"  > 

            <font color="white"><h1 class="card-title pricing-card-title">Ӣ��<small class="text-muted">/ װ��</small></h1> </font>
          </div>
        </div> 
         <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"  style="opacity:1"><font color="white">�������</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/KZF.jpg" onclick="toArticle()" style="height:150px;width:150px;" > 

            <font color="white"><h1 class="card-title pricing-card-title">${ins.articleCount}<small class="text-muted">/ �����</small></h1> </font>
          </div>
        </div> 
        <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">������̳</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/SSBS.jpg" onclick="toForum()" style="height:150px;width:150px;"  > 

            <font color="white"><h1 class="card-title pricing-card-title">�Ӿ�<small class="text-muted">/ ɾ��</small></h1> </font>
          </div>
        </div> 
        <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">��������</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/YXX.jpg" onclick="toComp()" style="height:150px;width:150px;" > 

            <font color="white"><h1 class="card-title pricing-card-title">${ins.complainCount} <small class="text-muted">/ ������</small></h1> </font>
          </div>
        </div> 
      </div>
      
       
      <div class="card-deck mb-3 text-center">
       <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">������Ʒ</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/MDSZS.jpg" onclick="toSendAcc()" style="height:150px;width:150px;" > 

            <font color="white"><h1 class="card-title pricing-card-title">${ins.sendAccCount} <small class="text-muted">/ ������</small></h1> </font>
          </div>
        </div> 
          <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">��Ʒ�ջ�</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/HY.jpg" onclick="toGetAcc()" style="height:150px;width:150px;" > 

            <font color="white"><h1 class="card-title pricing-card-title">${ins.getAccCount} <small class="text-muted">/ ������</small></h1> </font>
          </div>
        </div> 
            <div class="card mb-4 box-shadow a" style="background:#000" >  
  	
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">��������</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/LSZC.jpg" onclick="toResult()"  style="height:150px;width:150px;" > 

            <font color="white"><h1 class="card-title pricing-card-title">${ins.matchCount} <small class="text-muted">/ ������</small></h1> </font>
          </div>
        </div> 
      </div>
</div>
  
    





<form id="myform"></form>
</c:if>
<%@include file="footer.jsp" %>
<!-- ����ҳ�� -->

</body>
<SCRIPT language=javascript>
function toArticle()
 {
	  var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/adminQueryArticle.html";
    	 vform.submit();
 }	 
function toHero()
{
	  var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/queryHero.html";
   	 vform.submit();
}	 

function toForum()
{
	  var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/forum.html";
   	 vform.submit();
}

function toComp()
{
	  var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/adminQueryComp.html";
   	 vform.submit();
}	 

function toSendAcc()
{
	  var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/querySendAcc.html";
 	 vform.submit();
}	 
function toGetAcc()
{
	  var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/queryGetAcc.html";
 	 vform.submit();
}	
function toResult()
{
	  var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/announceResult.jsp";
   	 vform.submit();
}	 






</SCRIPT>







</html>