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
%>
<div id="nav" >	
<form>	
	<input type="hidden" name="aab101" value="<%=aab101%>">
			<input type="submit" class="btn btn-light" formaction="<%=path%>/mainPage.jsp" value="主页"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryBet.html" value="竞猜"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryArticle.html" value="文章"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryAcc.html" value="饰品"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryHero.html" value="英雄"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryEquipment.html" value="装备"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryEvent.html" value="赛事"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryMatch.html" value="比赛"/>
		    <input type="submit" class="btn btn-light" formaction="<%=path%>/queryPlayer.html" value="选手"/>
			<input type="submit" class="btn btn-light" formaction="<%=path%>/forum.html" value="论坛"/>
			<c:if test="${aab108==2}">
	            <input type="submit" class="btn btn-light" formaction="<%=path%>/adminGo.jsp"  value="网站管理"/>
		    </c:if>
</form>
    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:15;right:0;width:300;height:10;z-index:1;visibility:visible;"> 
		<span id="menubar" style="width:300" > 
			<font color=red size=2>
			   <c:if test="${aab108==2}">
			   		 <img id="havatar" src="/Avatar/${pic}" onclick="changeAvatar()" style="height:50px;width:50px;" >
			 		  管理员  <%=aab102%> 未读消息<%=unRead%>条 
			   </c:if>
		 	   <c:if test="${aab108==1}">  	      
		 	 		  <img id="havatar" src="/Avatar/${pic}" onclick="changeAvatar()" style="height:50px;width:50px;" >
		 	   		用户  <%=aab102%> 未读消息<%=unRead%>条
		 	   </c:if>
			   		<c:if test="${aab108==null}">游客
			   </c:if>		 
			</font>
		</span> 
		<!--实现鼠标悬停出现菜单  -->
		<div id="menu" style="position:absolute;top:15;right:0;width:300;height:10;z-index:2;visibility:hidden;"> 
			<form action ="<%=path%>/queryPerson.html" method="post">
<<<<<<< Upstream, based on branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
				<input type="hidden" name="aab101" value="<%=aab101%>">
=======
				<input type="hidden" name="aab101" value="<%=aab101%>">
>>>>>>> d1d3989 鏁村悎pull
				<div class="btn-group-vertical btn-group-sm">
				<input type="submit" name="toLog" class="btn btn-secondary" formaction="<%=path%>/login.jsp" value="注销">

				<c:if test="${aab108!=null}">
					<input type="submit"  name="toQpi" class="btn btn-secondary" formnovalidate="formnovalidate" value="个人信息">
					<input type="submit" name="toNotice" class="btn btn-secondary" formaction="<%=path%>/queryNotice.html" value="查看系统消息">
				</c:if>
			  	<c:if test="${aab108==null}">
	       			<input type="submit" name="psgToLog" class="btn btn-secondary" value="个人信息" formaction="<%=path%>/login.jsp">
	       			<input type="submit" name="psgToNotice" class="btn btn-secondary" formaction="<%=path%>/login.jsp" value="查看系统消息">
	     	    </c:if>
	     	    </div>
			</form>
			</div>
			</div>
</div>
aab101=<%=aab101%>
<br>
aab108=<%=aab108%>
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

