<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>��ӱ���</title>
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
<body>
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<div class="demoMatch" style="opacity: 0.9"></div>
<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
     <tr>
      <td>
              <font color="#000000" size="5px">�������   </font>
         </td>
      </tr>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>��������</td>
     <td>
       <e:text name="aac702"  required="true"   /> 
     </td>
   </tr> 
   <tr>
     <td>������ʼʱ��</td>
     <td>
        <input name="aac1102" type="datetime-local" />
     </td>
   </tr>
   <tr>
     <td>ս��1����</td>
     <td>
       <e:text name="aac1103"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>ս��2����</td>
     <td>
       <e:text name="aac1104"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="���"
              formaction="<%=path%>/addMatch.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>