<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>��������</title>
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
<body>
${msg}
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<div class="demoMatch" style="opacity: 0.9"></div>
<br>
<br>
 <c:if test="${ aab108==2 }">
 </c:if>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  align="center" class="table table-striped" style="background-color:#DFDCD1;opacity: 0.9;width:45%">
    <tr>
    <td>
        <font color="#000000" size="5px"> ����${aab108==2?'�޸�':'���' }</font>
    </td>
    </tr>
   <tr>
     <td>������</td>
     <td>
       <e:text name="aac702" required="true"  readonly="true"  defval="${ins.aac702 }"/> 
     </td>
   </tr>
   <tr>
     <td>������ʼʱ��</td>
     <td>
         <e:text name="aac1102"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1102 }"/>
     </td>
   </tr>
   
   <tr>
     <td>��ս˫��</td>
     <td>
        <e:text name="aac1103"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1103 }"/>VS
        <e:text name="aac1104"  required="true"  readonly="${aab108!=2 }"  defval="${ins.aac1104 }"/>  
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit"  class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
        <c:if test="${ aab108==2 }">
        <input type="submit"  class="btn btn-secondary  active" name="next" value="�޸�" 
              formaction="<%=path%>/modifyMatch.html"
              formnovalidate="formnovalidate">   
        </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1101" value="${param.aac1101 }">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>