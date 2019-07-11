<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
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
${msg}
<br>
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               文章${empty param.aab801?'添加':'阅读' }
       ${empty param.aab801 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">文章</td>
   </tr>
   <tr>
     <td>文章标题</td>
     <td>
       <e:text name="aab802" required="true"   /> 
     </td>
   </tr>
   <tr>
     <td>用户id</td>
     <td>
       <e:text name="aab101"  required="true"  />
     </td>
   </tr>
   <tr>
     <td>文章类型</td>
     <td>
       <e:text name="aab806"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>文章审核状态</td>
     <td>
       <e:text name="aab804"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>文章内容</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" name="next" value="添加"
              formaction="<%=path%>/addArticle.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>