<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
<title>���װ��</title>
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
<body onload="imgOnLoad('EBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#C0C2B8;opacity: 0.9;width:45%">
    <tr>
    <td>
      <font color="#000000" size="5px"> װ��${empty param.aac501?'���':'�޸�' }</font>
    </td>
    </tr>
   <tr>
     <td colspan="2">װ������</td>
   </tr>
   <tr>
     <td>װ����</td>
     <td>
       <e:text name="aac502" required="true" autofocus="true" defval="${ins.aac502 }"/> 
     </td>
   </tr>
   <c:if test="${empty param.aac501 }">
   <tr>
     <td>װ��ͼƬ</td>
     <td>
       <e:text name="aac505"    defval="${ins.aac505 }"/>     
     </td>
   </tr>  
   </c:if>
   <c:if test="${!empty param.aac501 }">
   <tr>
     <td>װ��ͼƬ</td>
     <td>
       <e:text name="aac505"  readonly="true"   defval="${ins.aac505 }"/> 
     </td>
   </tr>  
   </c:if>
   <tr>
     <td>װ���۸�</td>
     <td>
       <e:text name="aac503"  required="true" defval="${ins.aac503 }"/> 
     </td>
   </tr>   
   <tr>
     <td>װ��Ч��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac504" defval="${ins.aac504 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108==2}">
       <input type="submit" class="btn btn-secondary  active" name="next" value="${empty param.aac501?'���':'�޸�' }" class="btn" id="btn"
              formaction="<%=path%>/${empty param.aac501?'add':'modify' }Equipment.html">
              </c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryEquipment.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac501" value="${param.aac501 }">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>