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
<form action="<%=path%>/modifyEvent.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               �����޸�
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����</td>
   </tr>
   <tr>
     <td>������</td>
     <td>
       <e:text name="aac702" required="true" readonly="${aab108!=2}"  defval="${ins.aac702 }"/> 
     </td>
   </tr>
   <tr>
     <td>���¼���</td>
     <td>
       <e:text name="aac703"  required="true"  readonly="${aab108!=2}" defval="${ins.aac703 }"/>
     </td>
   </tr> 
   <tr>
     <td>�����ܽ���</td>
     <td>
        <e:text name="aac704"  required="true"  readonly="${aab108!=2}" defval="${ins.aac704 }"/> 
     </td>
   </tr>
   <tr>
     <td>���¿���ʱ��</td>
     <td>
       <e:date name="aac705"  required="true"  readonly="${aab108!=2}" defval="${ins.aac705 }"/> 
     </td>
   </tr>  
  
   <tr>
     <td>���½���ʱ��</td>
     <td>
       <e:date name="aac706"  required="true"  readonly="${aab108!=2}" defval="${ins.aac706 }"/> 
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
        <!-- ����Ա�ɼ���������ť -->
		<c:if test="${aab108==2}">
			<input type="submit" name="next" value="�޸�" 
              formaction="<%=path%>/modifyEvent.html"
              formnovalidate="formnovalidate">
		</c:if>
     </td>
   </tr>  
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
</body>
</html>