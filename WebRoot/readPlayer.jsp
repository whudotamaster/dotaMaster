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
<%@ include file="header.jsp" %>
${msg}
<br>
<br>
<form action="<%=path%>/findByIdPlayer.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               ѡ����Ϣ${aab108!=2?'��ѯ':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">ѡ��</td>
   </tr>
   <c:if test="${aab108==2}" >
   <tr>
     <td>ѡ��ͷ������</td>
     <td >
       <e:text name="aac1004"  required="true"  defval="${ins.aac1004 }" />
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108!=2}">
   <tr>
     <td>ѡ��ͷ��</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:15%; height:100%">
     </td>
   </tr>  
   </c:if>
   <tr>
     <td>ѡ����</td>
     <td>
       <e:text name="aac1002"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac1002 }"/> 
     </td>
   </tr>
   <tr>
     <td>ѡ���ǳ�</td>
     <td>
       <e:text name="aac1003"    readonly="${aab108!=2}" required="true" defval="${ins.aac1003 }"/>
     </td>
   </tr>
    <tr>
     <td>����ս��</td>
     <td>
       <e:text name="aac902"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac902 }"/> 
     </td>
   </tr>  
   <tr>
     <td>ѡ�ּ��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac1005" readonly="${aab108!=2}"  defval="${ins.aac1005 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryPlayer.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" name="next" value="�޸�" formaction="<%=path%>/modifyPlayer.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac1001" value="${param.aac1001 }">
</form>
</body>
</html>