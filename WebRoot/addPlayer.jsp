<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>���ѡ��</title>
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
<body onload="imgOnLoad('PlayerBg','jpg');pageOnLoad()">
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#1A7CA1;opacity: 0.8;width:45%">
    <tr>
      <td>
          <font color="#000000" size="5px">ѡ�����</font>   
    </td>
    </tr>
   <tr>
     <td>ѡ��ͷ��</td>
     <td>
       <e:text name="aac1004"  required="true"   /> 
     </td>
   </tr> 
   <tr>
     <td>ѡ����</td>
     <td>
       <e:text name="aac1002" required="true"   /> 
     </td>
   </tr>
   <tr>
     <td>ѡ���ǳ�</td>
     <td>
       <e:text name="aac1003"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>����ս��</td>
     <td>
       <e:text name="aac902"  required="true"   /> 
     </td>
   </tr>  
   <tr>
     <td>ѡ�ּ��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1005" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" class="btn btn-secondary  active"  name="next" value="���"
              formaction="<%=path%>/addPlayer.html">
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryPlayer.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>