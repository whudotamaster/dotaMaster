<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>���Ӣ��</title>
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
<body onload="imgOnLoad('bg','png');pageOnLoad()">

<%@ include file="header.jsp" %>
<br>
<br>
<form action="<%=path%>/addHero.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#D1DDF4;opacity: 0.9;width:45%">
    <tr>
    <c:if test="${aab108==2}">
    <td>
      <font color="#000000" size="5px"> Ӣ��${empty param.aac101?'���':'�޸�' }</font>
    </td>
    </c:if>
    <c:if test="${aab108!=2}">
    <td>
      <font color="#000000" size="5px"> Ӣ�ۻ����������</font>
    </td>
    </c:if>
    </tr>
    <tr>
     <td colspan="2">Ӣ������</td>
   </tr>
   <tr>
     <td>Ӣ����</td>
     <td>
       <e:text name="aac102" required="true" readonly="${aab108!=2}" autofocus="true" defval="${ins.aac102 }"/> 
     </td>
   </tr>
	   <tr>
	     <td>�����ɳ�</td>
	     <td>
	       <e:text name="aac103" required="true" readonly="${aab108!=2}" defval="${ins.aac103 }"/> 
	     </td>
	   </tr>
   <tr>
     <td>���ݳɳ�</td>
     <td>
       <e:text name="aac104" required="true" readonly="${aab108!=2}" defval="${ins.aac104 }"/> 
     </td>
   </tr>
   <tr>
     <td>�����ɳ�</td>
     <td>
       <e:text name="aac105" required="true" readonly="${aab108!=2}"  defval="${ins.aac105 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼѪ��</td>
     <td>
       <e:text name="aac106" required="true" readonly="${aab108!=2}"  defval="${ins.aac106 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
        <e:text name="aac107" required="true" readonly="${aab108!=2}" defval="${ins.aac107 }"/> 
     </td>
   </tr>
   <tr>
     <td>����</td>
     <td>
      <e:text name="aac108" required="true" readonly="${aab108!=2}" defval="${ins.aac108 }"/>  
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
      <e:text name="aac109" required="true" readonly="${aab108!=2}" defval="${ins.aac109 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
       <e:text name="aac110" required="true" readonly="${aab108!=2}" defval="${ins.aac110 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
        <e:text name="aac111" required="true" readonly="${aab108!=2}"  defval="${ins.aac111 }"/> 
     </td>
   </tr>
     <tr>
     <c:if test="${aab108==2}">
     <td>Ӣ��ͼƬ����</td>
     <td>
        <e:text name="aac112" required="true" readonly="${aab108!=2}" defval="${ins.aac112 }"/> 
     </td>
     </c:if>
   </tr>
   
   <tr>
     <td colspan="2" align="center">
     <c:if test="${aab108==2}">
       <input type="submit" class="btn btn-secondary  active" name="next" value="${empty param.aac101?'���':'�޸�' }"
              formaction="<%=path%>/${empty param.aac101?'add':'modify' }Hero.html">
              <input type="submit" class="btn btn-secondary  active" name="next" value="��Ӹ�Ӣ����Ʒ" 
	              formaction="<%=path%>/addAcc.jsp">
              </c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryHero.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac101" value="${param.aac101 }">
<e:hidden name="qaac102"/>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>