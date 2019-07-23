<div id="no">
<div id="no0" class="no"></div>
<div id="no1" class="no"></div>
<div id="no2" class="no"></div>
<div style="wider:100% ; height: 100%;">
<div id="no3" class="no"></div>
<div id="no4" class="no"></div>
<div id="no5" class="no"></div>
<div style="wider:100% ; height: 100%;">
<div id="no6" class="no"></div>
<div id="no7" class="no"></div>
<div id="no8" class="no"></div>
</div>
</div>
</div>
<%@ page language="java" 
    pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/arrows.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="shortcut icon" href="ico/favicon.ico" />
    <style type="text/css">
    
   body
  {
  color:black;
  }
 .pico
 {
   	cursor: url('ico/favicon2.ico'), default;
 
 }
 .demo{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/bg.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
        .demoLina{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/Lina.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
        .demoTa{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/ta.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
           .demoDOTA2{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/dota2.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
             .demoQOP{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/qop.png);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
          .demoLina2{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/Lina2.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
             .demoAcc{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/AccBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
             .demoEquipment{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/EBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            .demoEvent{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/EventBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            .demoAcc{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/AccBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
             .demoEquipment{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/EBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            .demoEvent{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/EventBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
           .demoMatch{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/MatchBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            .demoPlayer{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background-color: #fff;
                background: url(images/PlayerBg.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            .round_icon {
	display: flex;
	border-radius: 50%;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}
            } 
             html,body { wider:100% ; height: 100%;margin: 0; padding: 0;}

			#no{width:100%;height:100%;background:black;position:fixed;z-index:-1;}
			.no{width:calc(100%/3);height:calc(100%/3);float:left;  background-size: 100% 100%;}
    </style>
</head>
<%
String aab101=(String)session.getAttribute("aab101");
String aab102=(String)session.getAttribute("aab102");
String aab108=(String)session.getAttribute("aab108");
String aab109=(String)session.getAttribute("aab109");
int unRead=0;
if(session.getAttribute("unRead")!=null)
 unRead=Integer.parseInt(session.getAttribute("unRead").toString());
String path=request.getContextPath();
String pic = (String)session.getAttribute("pic");
%>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <a class="navbar-brand pico" href="mainPage.jsp">Dota Master</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryHero.html">英雄</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryEquipment.html">装备</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryAcc.html">饰品</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="#" onclick="forum()">论坛</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryArticle.html">文章</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryEvent.html">赛事</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryMatch.html">比赛</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico"  href="<%=path%>/queryBet.html">竞猜</a>
          </li>
           <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryTeam.html">战队</a>
          </li>
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/queryPlayer.html">选手</a>
          </li>		
           <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/BuyVip.jsp">VIP</a>
          </li>
           <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/BuyCurrency.jsp">虚拟货币</a>
          </li>
          	<c:if test="${aab108==2}">
             <li class="nav-item">
            <a class="nav-link pico" href="<%=path%>/adminGo.html">网站管理</a>
          </li>
          </c:if>
         </ul>
      </div>
    </nav>
<div id="nav" >

	

    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:15px;right:0px;width:300px;height:30px;z-index:1;visibility:visible;"> 
		<span id="menubar" style="width:300" > 
			<font color=white size=2>
			   <c:if test="${aab108==2}">
			   		<img id="havatar" class="pico" src="/Avatar/${pic}" onclick="toUpdate()" style="height:35px;width:35px;border-radius:50%" >
			 		  管理员  <%=aab102%>
			 		<c:if test="${unRead!=0}">
			 		  未读消息<%=unRead%>条
			 		  	<img id="havatar" class="pico" src="images/others/mail.jpg" onclick="toNotice()" style="height:35px;width:35px;border-radius:50%" >
			 		  </c:if>
			   </c:if>
		 	   <c:if test="${aab108==1}">
		 	 		  <img id="havatar" class="pico" src="/Avatar/${pic}" onclick="toUpdate()" style="height:35px;width:35px;border-radius:50%" >
		 	   		用户  <%=aab102%>
		 	   		<c:if test="${unRead!=0}">
			 		  未读消息<%=unRead%>条
			 		 <img id="havatar" class="pico" src="images/others/mail.jpg" onclick="toNotice()" style="height:35px;width:35px;border-radius:50%" >
			 		  </c:if>
		 	   </c:if>
			   		<c:if test="${aab108==null}">游客
			   </c:if>
			</font>
		</span>
			</div>
</div>
<form id="formX"> 	<input type="hidden" name="aab101" value="<%=aab101%>"></form>
<div id="mymenu" class="mymenu">
<c:if test="${aab108==null}">
<img id="left"  class="arrow left pico" src="images/others/notice.jpg" onclick="toLogin()" >
<img id="right" class="arrow right pico" src="images/others/uncomplete.jpg"  onclick="toLogin()" >
<img id="up" class="arrow up pico" src="images/others/person.jpg" onclick="toLogin()" >
<img id="down" class="arrow down pico" src="images/others/quit.jpg" onclick="toLogin()" >
</c:if>
<c:if test="${aab108!=null}">
<img id="left"  class="arrow left pico" src="images/others/notice.jpg" onclick="toNotice()" >
<img id="right" class="arrow right pico" src="images/others/uncomplete.jpg"  onclick="toMission()" >
<img id="up" class="arrow up pico" src="images/others/person.jpg" onclick="toUpdate()" >
<img id="down" class="arrow down pico" src="images/others/quit.jpg" onclick="toLogin()" >
</c:if>
</div>
<br>
<form id="forum" ><input type="text" hidden="true" name="aab101" id="aab101" value="<%=aab101%>"></form>
	<SCRIPT language=javascript>
	 	 function onNext()
	 	 {
	 		 document.getElementById("nowFloor").value = parseInt(document.getElementById("nowFloor").value) +1 ;
	 		 document.getElementById("myform").submit();
	 	 }
	 	function onBack()
		 {
			 document.getElementById("nowFloor").value = parseInt(document.getElementById("nowFloor").value) -1 ;
			 document.getElementById("myform").submit();
		 }
	 	function onQuery()
	 	{
	 		var vform = document.getElementById("myform");
	 		document.getElementById("nowFloor").value = 1;
	 		vform.submit();
	 	}
	     function back()
	     {
	   	 	document.getElementById("nowFloor").value = 1;
	     }
	     
	 	 function pageOnLoad()
	 	 {
			document.getElementById("nextFloor").disabled = ${!(rows[0].nowFloor < rows[0].floor)};
	 		document.getElementById("backFloor").disabled = ${!(rows[0].nowFloor > 1)}
	 	 }

	 	function toNotice()
	 	 {
	 		  var vform = document.getElementById("formX");
	 	    	 vform.action="<%=path%>/queryNotice.html";
	 	    	 vform.submit();
	 	 }
		function toMission()
	 	 {
	 		  var vform = document.getElementById("formX");
	 	    	 vform.action="<%=path%>/queryMission.html";
	 	    	 vform.submit();
	 	 }
		function toUpdate()
	 	 {
	 		  var vform = document.getElementById("formX");
	 	    	 vform.action="<%=path%>/queryPerson.html";
	 	    	 vform.submit();
	 	 }
		function toLogin()
	 	 {
	 		  var vform = document.getElementById("formX");
	 	    	 vform.action="<%=path%>/logout.html";
	 	    	 vform.submit();
	 	 }
	 	//鼠标事件*******************************
	 /*	function test()
{
alert(event.x+" "+event.y);
alert(event.button);
} */
/*右键菜单不显示*/
	document.oncontextmenu=function()
	{
		return false;
	}
	document.onmousedown=function()
	{
		if(event.button==2)
		{
			var mymenu = document.getElementById("mymenu");
			mymenu.style.zIndex = 5;
			mymenu.style.opacity = 1;
			mymenu.style.left = event.pageX-150+'px';
			mymenu.style.top= event.pageY-150+'px';
		}
		if(event.button==0)
		{
			var mymenu = document.getElementById("mymenu");
			mymenu.style.opacity = 0;
			mymenu.style.zIndex = 1;
		}
	}
/*
document.onkeydown=function()
{
alert(event.keyCode);
} */
    //鼠标事件结束************************************
	 	 
	      function imgOnLoad(image,type)
	      {
	      	for(var i = 0 ; i<9;i++)
	      	{
	      	var id = "no" + i ;
	      		document.getElementById(id).style.backgroundImage="url(images/"+ image + "_" + i +"."+type+")";	
	      	}
	      }
	      
	      function forum()
	      {
	    	  var form = document.getElementById("forum");
	    	  form.action = "<%=path%>/forum.html";
	    	  form.submit();
	      }
	</SCRIPT> 

