<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>�޸�����</title>
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
<body onload="imgOnLoad('EventBg','jpg');pageOnLoad()">
<%@ include file="header.jsp" %>

<!-- ����ͷ�������� -->
<br>
<br>
<form action="<%=path%>/modifyEvent.html" method="post">
<table align="center" class="table table-striped" style="background-color:#BABABA;opacity: 0.9;width:45%">
   <tr>
    <td>
      <font style="color:#000000" size="5px">�����޸�</font> 
    </td>
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
       <e:radio name="aac703"  required="true"  readonly="${aab108!=2}" value="Major:0,Minor:1,����:2" defval="${ins.aac703 }" />
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
        <!-- ����Ա�ɼ���������ť -->
       <c:if test="${aab108==2}">
			<input type="submit" class="btn btn-secondary  active" name="next" value="�޸�" 
              formaction="<%=path%>/modifyEvent.html"
              formnovalidate="formnovalidate">
		</c:if>
       <input type="submit" class="btn btn-secondary  active" name="next" value="����" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>  
</table>
<input type="hidden" name="aac701" value="${param.aac701 }">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
</html>