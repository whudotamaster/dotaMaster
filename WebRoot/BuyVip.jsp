<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>����VIP</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style type="text/css">
.rtop dd{ text-algin:center }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="demoTeam" style="opacity: 0.9"></div>
<form id="form"  method="post">
<table align="center" class="table table-striped" style="background-color:#EEEEEE;opacity: 0.9;width:45%">
    <tr>
    <td>
      <font color="#000000" size="5px"> vip���� </font>
    </td>
    </tr>
   <tr>
     <td>��Ʒ����</td>
     <td>
       <e:text name="WIDsubject"  value="vip" readonly="true"/> 
     </td>
   </tr>
   <tr>
     <td>������</td>
     <td>
       <e:text name="WIDtotal_amount"  required="true" />
     </td>
   </tr>  
   <tr>
     <td>��Ʒ����</td>
     <td>
       <e:textarea rows="5" cols="45" name="WIDbody" value="����һ��vip�������������10Ԫ1��"  />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="button"  class="btn btn-secondary  active" name="next" value="����"
				             onclick="add()" >
     </td>
   </tr>
</table>		
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
  function add(){
    var WIDsubject =document.getElementById("WIDsubject").value; 
    var WIDtotal_amount = document.getElementById("WIDtotal_amount").value; 
    var WIDbody=document.getElementById("WIDbody").value; 
    var vform = document.getElementById("form");
    vform.action="alipay.jsp?a="+encodeURIComponent(encodeURIComponent(WIDsubject))
    		+"&b="+encodeURIComponent(encodeURIComponent(WIDtotal_amount))+"&c="
    		+encodeURIComponent(encodeURIComponent(WIDbody));
    //alert(vform.action);
    vform.submit();
 }
</script>
</html>