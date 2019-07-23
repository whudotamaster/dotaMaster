<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>购买VIP</title>
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
      <font color="#000000" size="5px"> vip购买 </font>
    </td>
    </tr>
   <tr>
     <td>商品名称</td>
     <td>
       <e:text name="WIDsubject"  value="vip" readonly="true"/> 
     </td>
   </tr>
   <tr>
     <td>付款金额</td>
     <td>
       <e:text name="WIDtotal_amount"  required="true" />
     </td>
   </tr>  
   <tr>
     <td>商品描述</td>
     <td>
       <e:textarea rows="5" cols="45" name="WIDbody" value="这是一个vip购买测试用例，10元1月"  />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="button"  class="btn btn-secondary  active" name="next" value="付款"
				             onclick="add()" >
     </td>
   </tr>
</table>		
</form>
<!-- 引入脚部导航栏 -->
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