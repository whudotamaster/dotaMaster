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
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  border="1" align="center" width="45%">
      <caption>
              �������   
    </caption>
   <tr>
     <td colspan="2">ѡ��</td>
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
        <input type="datetime-local" value=""/>
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
     <input type="submit" name="next" value="���"
              formaction="<%=path%>/addMatch.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>