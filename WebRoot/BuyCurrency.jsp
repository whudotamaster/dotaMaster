<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<form id="form"  method="post">
<dl class="content">
					
					<dt>��Ʒ���� ��</dt>
					<dd>
						<input id="WIDsubject" name="WIDsubject" value="�������"  readonly="readonly"/>
					</dd>
					<dt>������ ��</dt>
					<dd>
						<input id="WIDtotal_amount" name="WIDtotal_amount"  required="required"  />
					</dd>
					<dt>��Ʒ������</dt>
					<dd>
						<input id="WIDbody" name="WIDbody" value="����һ��������ҹ����������������Ϊ1��100"  style="width:700px;" />
					</dd>
					<dt></dt>
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
						<input type="button" name="next" value="����"
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