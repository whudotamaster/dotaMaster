<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>战队介绍</title>
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
<body onload="imgOnLoad('TeamBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
<table  align="center" border="1"  style="background-color:#EEEEEE;opacity: 0.9;width:45%" style="background-color:#EEEEEE;opacity: 0.9;width:45%">
    <tr>
    <td>
          <font color="#000000" size="5px">战队及成员信息${aab108!=2?'查询':'修改' }</font>    
      </td>
    </tr>
   <tr>
     <td colspan="2">战队</td>
   </tr>
   <tr>
     <td>战队名</td>
     <td>
       <e:text name="aac902"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac902 }"/> 
     </td>
   </tr>
   <c:if test="${aab108!=2}">
   <tr >
     <td>战队图片</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac903 } style="width:12%; height:100%">
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108==2}" >
   <tr>
     <td>战队图片链接</td>
     <td >
       <img alt="no image" src=<%=path%>/images/${ins.aac903 } style="width:12%; height:100%" >
       <c:if test="${aab108==2}" >
       <e:text name="aac903"  required="true"  defval="${ins.aac903 }" />
       </c:if>
     </td>
   </tr>  
   </c:if>
    <tr>
     <td>战队简介</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac904" defval="${ins.aac904 }"/>
     </td>
   </tr>
    <c:if test="${aab108==2}" >  
    <td>  
        <input type="submit" name="next" value="战队修改" formaction="<%=path%>/modifyTeam.html" formnovalidate="formnovalidate" >      
   </td>
   </c:if >
   <tr>
    <tr>
     <td colspan="2">成员</td>
   </tr>
   <c:choose>
	     <c:when test="${ins.rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${ins.rows }" var="ins" varStatus="vs">
	    <tr>
           <td>选手名</td>
            <c:if test="${aab108!=2}" >
            <td>
            <e:text name="aac1002"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac1002 }"/> 
            </td>
            </c:if>
            <c:if test="${aab108==2}" >
            <td >
		    <!-- #  空锚 -->
			<a  href="#" onclick="onEdit('${ins.aac1001}')">${ins.aac1002 }</a>
		    </td>  
		    </c:if>
        </tr>  
         <tr>
         <td>选手头像</td>
         <td>
           <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:12%; height:100%" >
           <c:if test="${aab108==2}" >
           <e:text name="aac1004"   readonly="true"  required="true"  defval="${ins.aac1004 }" /> 
           </c:if>
         </td>
          </tr>  
	       </c:forEach>
         </c:when>
   </c:choose>
 
   <tr>
     <td colspan="2" align="center">
      <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="添加战队成员" 
	              formaction="<%=path%>/addPlayer.jsp">
	            </c:if>
       <input type="submit" name="next" class="btn btn-secondary  active"  value="返回" 
              formaction="<%=path%>/queryTeam.html"
              formnovalidate="formnovalidate">
              
     </td>
   </tr>
</table>
<input type="hidden" name="aac901" value="${ins.aac901 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    
      function onEdit(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>  
</html>