<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
${msg}
<div class="demoPlayer" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  align="center" border="1" style="background-color:#1A7CA1;opacity: 0.9;width:45%">
    <tr>
    <td>
      <font color="#000000" size="5px"> 选手信息${aab108!=2?'查询':'修改' }</font>
    </td>
    </tr>
   <c:if test="${aab108==2}" >
   <tr>
     <td>选手头像链接</td>
     <td >
       <e:text name="aac1004"  required="true"  defval="${ins.aac1004 }" />
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108!=2}">
   <tr>
     <td>选手头像</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:15%; height:100%">
     </td>
   </tr>  
   </c:if>
   <tr>
     <td>选手名</td>
     <td>
       <e:text name="aac1002"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac1002 }"/> 
     </td>
   </tr>
   <tr>
     <td>选手昵称</td>
     <td>
       <e:text name="aac1003"    readonly="${aab108!=2}" required="true" defval="${ins.aac1003 }"/>
     </td>
   </tr>
    <tr>
     <td>所属战队</td>
     <td>
       <e:text name="aac902"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac902 }"/> 
     </td>
   </tr>  
   <tr>
     <td>选手简介</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1005" readonly="${aab108!=2}"  defval="${ins.aac1005 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/queryPlayer.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" class="btn btn-secondary  active" name="next" value="修改" formaction="<%=path%>/modifyPlayer.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1001" value="${param.aac1001 }">
</form>
<!-- 引入脚部导航栏 -->
<%@ include file="footer.jsp" %>
</body>
</html>