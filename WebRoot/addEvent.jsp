<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>�������</title>
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
${msg}
<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/findByIdEvent.html" method="post">
<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:45%">
   <tr>
    <td>
        <font color="#000000" size="5px"> �������</font>
   </td>
    </tr>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>������</td>
     <td>
       <e:text name="aac702" required="true" readonly="true" autofocus="true" /> 
     </td>
   </tr> 
    <tr>
     <td>���¼���</td>
     <td>
      <e:radio name="aac703"  required="true"  value="Major:0,Minor:1,����:2" defval="0" /> 
     </td>
   </tr>
   <tr>
     <td>�����ܽ���</td>
     <td>
       <e:text name="aac704"  required="true" />
     </td>
   </tr>
   <tr>
     <td>���¿���ʱ��</td>
     <td>
       <e:date name="aac705"  required="true" />
     </td>
   </tr>
   <tr>
     <td>���½���ʱ��</td>
     <td>
       <e:date name="aac706"  required="true" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active" name="next" value="���"
              formaction="<%=path%>/addEvent.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>