<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<link rel="shortcut icon" href="ico/favicon.ico" />
<title>�������</title>
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
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<div class="demoTa" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:45%">
   <tr>
    <td colspan="2" >
        <font color="#000000" size="5px"> ����${empty param.aab801?'���':'�Ķ�' }</font>
    </td>
    </tr>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>���±���</td>
     <td>
       <e:text name="aab802" required="true"   /> 
     </td>
   </tr>
 
   <tr>
     <td>��������</td>
     <td>
       <e:radio name="aab806"  required="true"  value="����:0,����ս��:1,Ӣ�۹���:2" defval="0" /> 
     </td>
   </tr>  

   <tr>
     <td>��������</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" />
     </td>
   </tr>
   <input type="hidden" name="aab101" value="<%=aab101%>">
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="���"
              formaction="<%=path%>/addArticle.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>