<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="nav" >
  <ul>
    <li ><a href="">查询</a></li>
    <li><a href="">竞猜</a></li>
    <li><a href="">饰品商城</a></li>
    <li><a href="">论坛</a></li>
    <li><a href="">导航5</a></li>
    <li><a href="">导航6</a></li>
    <li>
    <div id="back"  onmouseover="menu.style.visibility='visible'" onmouseout="out()"style="position:absolute;top:225;left:250;width:160;height:40;z-index:1;visibility:visible;"> 
<span id="menubar" > 
<font color=red size=2>${ins[0].aab102 }</span> 
<!--实现鼠标悬停出现菜单  -->
<div border=1 id="menu" style="position:absolute;top:15;left:0;width:75;height:10;z-index:2;visibility:hidden;"> 
<a id="toSignIn" href="login.jsp">登录</a> 
<a id="toUpdPsnInf" href="updatePersonInfo.jsp">修改个人信息</a> 
<a id="link" href="LINK3.htm">LINK3</a> 
<a id="link" href="LINK4.htm">LINK4</a> 
<a id="link" href="LINK5.htm">LINK5</a> 
<a id="link" href="LINK6.htm">LINK6</a> 
</div> 
</div> 
    
    </li>
  </ul>
</div>

<SCRIPT language=javascript><!-- 
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
</SCRIPT> 
 



