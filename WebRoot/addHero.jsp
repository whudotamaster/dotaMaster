<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>添加英雄</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body onload="imgOnLoad('bg','png');pageOnLoad()">

<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/addHero.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#D1DDF4;opacity: 0.9;width:45%">
    <tr>
    <c:if test="${aab108==2}">
    <td>
      <font color="#000000" size="5px"> 英雄${empty param.aac101?'添加':'修改' }</font>
    </td>
    </c:if>
    <c:if test="${aab108!=2}">
    <td>
      <font color="#000000" size="5px"> 英雄基础属性浏览</font>
    </td>
    </c:if>
    </tr>
    <tr>
     <td colspan="2">英雄数据</td>
   </tr>
   <tr>
     <td>英雄名</td>
     <td>
       <e:text name="aac102" required="true" readonly="${aab108!=2}" autofocus="true" defval="${ins.aac102 }"/> 
     </td>
   </tr>
	   <tr>
	     <td>力量成长</td>
	     <td>
	       <e:text name="aac103" required="true" readonly="${aab108!=2}" defval="${ins.aac103 }"/> 
	     </td>
	   </tr>
   <tr>
     <td>敏捷成长</td>
     <td>
       <e:text name="aac104" required="true" readonly="${aab108!=2}" defval="${ins.aac104 }"/> 
     </td>
   </tr>
   <tr>
     <td>智力成长</td>
     <td>
       <e:text name="aac105" required="true" readonly="${aab108!=2}"  defval="${ins.aac105 }"/> 
     </td>
   </tr>
   <tr>
     <td>初始血量</td>
     <td>
       <e:text name="aac106" required="true" readonly="${aab108!=2}"  defval="${ins.aac106 }"/> 
     </td>
   </tr>
   <tr>
     <td>初始蓝量</td>
     <td>
        <e:text name="aac107" required="true" readonly="${aab108!=2}" defval="${ins.aac107 }"/> 
     </td>
   </tr>
   <tr>
     <td>移速</td>
     <td>
      <e:text name="aac108" required="true" readonly="${aab108!=2}" defval="${ins.aac108 }"/>  
     </td>
   </tr>
   <tr>
     <td>初始力量</td>
     <td>
      <e:text name="aac109" required="true" readonly="${aab108!=2}" defval="${ins.aac109 }"/> 
     </td>
   </tr>
   <tr>
     <td>初始敏捷</td>
     <td>
       <e:text name="aac110" required="true" readonly="${aab108!=2}" defval="${ins.aac110 }"/> 
     </td>
   </tr>
   <tr>
     <td>初始智力</td>
     <td>
        <e:text name="aac111" required="true" readonly="${aab108!=2}"  defval="${ins.aac111 }"/> 
     </td>
   </tr>
     <tr>
     <c:if test="${aab108==2}">
     <td>英雄图片链接</td>
     <td>
        <e:text name="aac112" required="true" readonly="${aab108!=2}" defval="${ins.aac112 }"/> 
     </td>
     </c:if>
   </tr>
   
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108==2}">
       <input type="submit" class="btn btn-secondary  active" name="next" value="${empty param.aac101?'添加':'修改' }"
              formaction="<%=path%>/${empty param.aac101?'add':'modify' }Hero.html">
              <input type="submit" class="btn btn-secondary  active" name="next" value="添加该英雄饰品" 
	              formaction="<%=path%>/addAcc.jsp">
              </c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryHero.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac101" value="${param.aac101 }">
<e:hidden name="qaac102"/>
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>