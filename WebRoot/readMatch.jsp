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
 <c:if test="${ aab108==2 }">
 </c:if>
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               ����${aab108==2?'���':'�޸�' }
      ${aab108==2}
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>������</td>
     <td>
       <e:text name="aac702" required="true" readonly="${aab108!=2 }"  defval="${ins.aac702 }"/> 
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
     <td>ʤ��</td>
     <td>
           ����<e:select name="aac1105" value="δ��ʼ:00,ʤ:01,��:02" defval="${ins.aac1105 }" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryMatch.html"
              formnovalidate="formnovalidate">
        <c:if test="${ aab108==2 }">
        <input type="submit" name="next" value="�޸�" 
              formaction="<%=path%>/modifyMatch.html"
              formnovalidate="formnovalidate">   
        </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1101" value="${param.aac1101 }">
</form>
</body>
</html>