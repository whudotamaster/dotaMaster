<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>������ϸ</title>
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
<body onload="imgOnLoad('ta','jpg');pageOnLoad()">
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#7F8BB3;opacity: 0.9;width:45%">
   <tr>
    <td colspan="2">
       <font color="#000000" size="5px"> ����${empty param.aab801?'���':'�Ķ�' }</font>
    </td>
   </tr>
   <tr>
    <td>���±���</td>
     <td>
       <e:text name="aab802" required="true" readonly="true"  defval="${ins.aab802 }"/> 
     </td>
   </tr>
   <tr>
     <td>��������</td>
     <td>
       <e:text name="aab102"  required="true"  readonly="true" defval="${ins.aab102 }"/>
     </td>
   </tr>
   
   <c:if test="${!empty param.aab101 }">
   <tr>
     <td>����ʱ��</td>
     <td>
        <e:text name="aab805"  required="true"  readonly="true" defval="${ins.aab805 }"/> 
     </td>
   </tr>
   </c:if>
   <tr>
     <td>��������</td>
     <td>
       <e:text name="aab806"  required="true"  readonly="true" defval="${ins.aab806 }"/> 
     </td>
   </tr>  
  
   <tr>
     <td>��������</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab803" readonly="true"  defval="${ins.aab803 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108!=2}">
       <input type="submit"  class="btn btn-secondary  active"  name="next" value="����" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </c:if>
 <!-- ����Ա�ɼ���������ť -->
		<c:if test="${aab108==2}">
			<input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/adminQueryArticle.html"
              formnovalidate="formnovalidate">
			<input type="submit" class="btn btn-secondary  active" name="pass" value="���ͨ��"
					formaction="<%=path%>/passArticle.html"
					formnovalidate="formnovalidate">
			<input type="submit" class="btn btn-secondary  active" name="unpass" value="��˲�ͨ��"
					formaction="<%=path%>/unpassArticle.html"
					formnovalidate="formnovalidate">
		</c:if>
		<c:if test="${aab101 !=null }">
 						<input type="button" class="btn btn-secondary  active" value="����" 
				       onclick="reward('${param.aab801 }','${ins.aab101}')"
				            formnovalidate="formnovalidate" >
				            </c:if>
				         <c:if test="${aab101 ==null }">
 						<input type="button" class="btn btn-secondary  active" value="����" 
				       		formaction = "login.html"
				            formnovalidate="formnovalidate" >
				            </c:if>   
     </td>
   </tr>
   		<input type="hidden" name="aab801" value="${ins.aab801 }">
   		<input type="hidden" name="aab101" value="${aab101 }">
</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
<script>
function reward(vaab801,paab101)
{	
	 var vform = document.getElementById("myform");

	 vform.action="<%=path%>/rewardForArticle.html?paab101="+paab101;

	 //alert(vform.action);
	 vform.submit();
}
</script>
</body>
</html>