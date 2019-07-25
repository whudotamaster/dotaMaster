<%@ page language="java"  pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理岛</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
    <link href="css/pricing.css" rel="stylesheet">
<style>
.a{
opacity:0.8;
   	cursor: url('ico/favicon2.ico'), default;
}
.a:hover{
opacity:1;

}
</style>
<script type="text/javascript" src="jquery.js"></script>
</head>
<body onload="imgOnLoad('AdminGo','jpg');pageOnLoad()">
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
<c:if test="${aab108==2}">
 <div class="container" style="z-index:2" >
      <div class="card-deck mb-3 text-center">
       <div class="card mb-4 box-shadow a" onclick="toHero()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">版本更新</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/XLZR.jpg"  style="height:150px;width:150px;"  >
            <font color="white"><h1 class="card-title pricing-card-title">英雄<small class="text-muted">/ 装备</small></h1> </font>
          </div>
        </div>
         <div class="card mb-4 box-shadow a" onclick="toArticle()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"  style="opacity:1"><font color="white">审核文章</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/KZF.jpg"  style="height:150px;width:150px;" >
            <font color="white"><h1 class="card-title pricing-card-title">${ins.articleCount}<small class="text-muted">/ 待审核</small></h1> </font>
          </div>
        </div>
        <div class="card mb-4 box-shadow a" onclick="toForum()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">管理论坛</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/SSBS.jpg"  style="height:150px;width:150px;"  >
            <font color="white"><h1 class="card-title pricing-card-title">加精<small class="text-muted">/ 删帖</small></h1> </font>
          </div>
        </div>
        <div class="card mb-4 box-shadow a"  onclick="toComp()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">处理申诉</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/YXX.jpg" style="height:150px;width:150px;" >
            <font color="white"><h1 class="card-title pricing-card-title">${ins.complainCount} <small class="text-muted">/ 待处理</small></h1> </font>
          </div>
        </div>
      </div>
      <div class="card-deck mb-3 text-center">
       <div class="card mb-4 box-shadow a"  onclick="toSendAcc()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">发送饰品</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/MDSZS.jpg"style="height:150px;width:150px;" >
            <font color="white"><h1 class="card-title pricing-card-title">${ins.sendAccCount} <small class="text-muted">/ 待发送</small></h1> </font>
          </div>
        </div>
          <div class="card mb-4 box-shadow a"onclick="toGetAcc()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">饰品收货</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/HY.jpg"  style="height:150px;width:150px;" >
            <font color="white"><h1 class="card-title pricing-card-title">${ins.getAccCount} <small class="text-muted">/ 待接收</small></h1> </font>
          </div>
        </div>
            <div class="card mb-4 box-shadow a"  onclick="toResult()" style="background:#000" >
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"     style="opacity:1"><font color="white">公布赛果</font></h4>
          </div>
          <div class="card-body">
     		<img id="havatar" src="images/equip/LSZC.jpg"  style="height:150px;width:150px;" >
            <font color="white"><h1 class="card-title pricing-card-title">${ins.matchCount} <small class="text-muted">/ 待公布</small></h1> </font>
          </div>
        </div>
      </div>
</div>
<form id="myform">
<e:hidden name="aab101" defval="${aab101 }"/>
</form>
</c:if>
<%@include file="footer.jsp" %>
<!-- 引入页脚 -->
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