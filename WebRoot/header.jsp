<%@ page language="java" 
    pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    <style type="text/css">
   body
  {
  color:black;
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
      <a class="navbar-brand" href="mainPage.jsp">Dota Master</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav mr-auto">
        
          <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryHero.html">英雄</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryEquipment.html">装备</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryAcc.html">饰品</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/forum.html">论坛</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryArticle.html">文章</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryEvent.html">赛事</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryMatch.html">比赛</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryBet.html">竞猜</a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/queryPlayer.html">选手</a>
          </li>		
          	<c:if test="${aab108==2}">
          
             <li class="nav-item">
            <a class="nav-link" href="<%=path%>/adminGo.html">网站管理</a>
          </li>
          </c:if>
         </ul>
      </div>
    </nav>
<div id="nav" >

	

    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:15px;right:0px;width:300px;height:10px;z-index:1;visibility:visible;"> 
		<span id="menubar" style="width:300" > 
			<font color=white size=2>
			   <c:if test="${aab108==2}">
			   		 <img id="havatar" src="/Avatar/${pic}" onclick="changeAvatar()" style="height:35px;width:35px;" >
			 		  管理员  <%=aab102%> 
			 		<c:if test="${unRead!=0}">
			 		  未读消息<%=unRead%>条 
			 		  </c:if>
			   </c:if>
		 	   <c:if test="${aab108==1}">  	      
		 	 		  <img id="havatar" src="/Avatar/${pic}" onclick="changeAvatar()" style="height:35px;width:35px;" >
		 	   		用户  <%=aab102%> 	
		 	   		<c:if test="${unRead!=0}">
			 		  未读消息<%=unRead%>条 
			 		  </c:if>
		 	   </c:if>
			   		<c:if test="${aab108==null}">游客
			   </c:if>		 

			</font>
		</span> 
		<!--实现鼠标悬停出现菜单  -->
		<div id="menu" style="position:absolute;top:15px;right:0px;width:300;height:10px;z-index:2;visibility:hidden;"> 
			<form method="post">
				<input type="hidden" name="aab101" value="<%=aab101%>">
				<div class="btn-group-vertical btn-group-sm">
				<c:if test="${!empty aab108}">
				<input type="submit" name="toLog" class="btn btn-secondary" formaction="<%=path%>/logout.html" value="注销">
				</c:if>
				<c:if test="${empty aab108}">
				<input type="submit" name="toLog" class="btn btn-secondary" formaction="<%=path%>/logout.html" value="登录">
				</c:if>
				<c:if test="${aab108!=null}">
					<input type="submit"  name="toQpi" class="btn btn-secondary"  formaction="<%=path%>/queryPerson.html" value="个人信息">
					<input type="submit" name="toNotice" class="btn btn-secondary" formaction="<%=path%>/queryNotice.html" value="系统消息">
					<input type="submit" name="toMission" class="btn btn-secondary" formaction="<%=path%>/queryMission.html" value="日常任务">
				</c:if>
			  	<c:if test="${aab108==null}">
	       			<input type="submit" name="psgToLog" class="btn btn-secondary"  formaction="<%=path%>/login.jsp" value="个人信息">
	       			<input type="submit" name="psgToNotice" class="btn btn-secondary" formaction="<%=path%>/login.jsp" value="查看系统消息">
	     	    </c:if>
	     	    </div>
			</form>
			</div>
			</div>
</div>
<br>
	<SCRIPT language=javascript>
<!-- 
	function out() 
	{ 
		if(window.event.toElement.id!="menu" && window.event.toElement.id!="link") 
		menu.style.visibility="hidden"; 
	} 
	//--> 
		function out1() 
		{ 
			if(window.event.toElement.id!="menu1" && window.event.toElement.id!="link") 
			menu1.style.visibility="hidden"; 
		} 
		//--> 
		//傻逼github天天删劳资注释 lzzscl
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
	     
	 	 window.onload = function()
	 	 {
			document.getElementById("nextFloor").disabled = ${!(rows[0].nowFloor < rows[0].floor)}; 
	 		document.getElementById("backFloor").disabled = ${!(rows[0].nowFloor > 1)}
	 	 }
	</SCRIPT> 

