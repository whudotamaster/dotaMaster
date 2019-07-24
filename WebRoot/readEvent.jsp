<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>查看比赛信息</title>
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
<body onload="imgOnLoad('EventBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>
${msg}
<br>
<br>
<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
<table  align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:45%">
    <tr>
    <td>
       <font color="#000000" size="4px">赛事比赛信息浏览</font>
    </td>
    </tr>
      <tr>
	    <td>赛事名</td>
	    <td>比赛开始时间</td>
	    <td>战队1名称</td>
	    <td>战队2名称</td>
	    <td>胜负</td>
	    <td></td>
	  </tr>
   <c:choose>
	     <c:when test="${ins.rows!=null }">
	         <!-- 显示实际查询到的数据 -->
	    <c:forEach items="${ins.rows }" var="ins2" varStatus="vs" begin="0" end="10">
	    <tr>        
	        <td>
	        <e:text name="aac702"   readonly="true"  required="true"  defval="${ins.aac702 }"/>
	        </td> 
            <td>
            <e:text name="aac1102"   readonly="true"  required="true"  defval="${ins2.aac1102 }"/>
            </td>
           
            <td >
			<e:text name="aac1103"   readonly="true"  required="true"  defval="${ins2.aac1103 }"/>
		    </td> 
            
            <td >
			<e:text name="aac1104"   readonly="true"  required="true"  defval="${ins2.aac1104 }"/>
		    </td>    
            <td>
            <e:select name="aac1105" readonly="true" required="true"  value="未开始:0,胜:1,负:2" defval="${ins2.aac1105 }"  disabled="true"/>
            </td>
        </tr>   
        </c:forEach>
        </c:when>
   </c:choose>
</table>

 <table align="center">
   <tr align="center">
     <td colspan="2" align="center">
      <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="添加" 
	              formaction="<%=path%>/addMatch.jsp">
	              </c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
 </table>
 <input type="hidden" name="aac702" value="${ins.aac702 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    
      function onEdit(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>  
</html>