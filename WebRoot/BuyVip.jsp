<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form id="form"  method="post">
<dl class="content">
					
					<dt>商品名称 ：</dt>
					<dd>
						<input id="WIDsubject" name="WIDsubject" value="vip会员"  readonly="readonly"/>
					</dd>
					<dt>付款金额 ：</dt>
					<dd>
						<input id="WIDtotal_amount" name="WIDtotal_amount" value="100" readonly="readonly" />
					</dd>
					<dt>商品描述：</dt>
					<dd>
						<input id="WIDbody" name="WIDbody" value="这是一个vip购买测试用例" readonly="readonly" />
					</dd>
					<dt></dt>
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
						<input type="button" name="next" value="付款"
				             onclick="add()" >
						</span>
					</dd>
				</dl>
</form>
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