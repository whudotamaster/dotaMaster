<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
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
<br>
<br>
<form action="<%=path%>/addHero.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       Ӣ��${empty param.aac101?'���':'�޸�' }
       ${empty param.aac101 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">Ӣ������</td>
   </tr>
   <tr>
     <td>Ӣ����</td>
     <td>
       <e:text name="aac102" required="true" autofocus="true" defval="${ins.aac102 }"/> 
     </td>
   </tr>
	   <tr>
	     <td>�����ɳ�</td>
	     <td>
	       <e:text name="aac103" required="true"  defval="${ins.aac103 }"/> 
	     </td>
	   </tr>
   <tr>
     <td>���ݳɳ�</td>
     <td>
       <e:text name="aac104" required="true"  defval="${ins.aac104 }"/> 
     </td>
   </tr>
   <tr>
     <td>�����ɳ�</td>
     <td>
       <e:text name="aac105" required="true"  defval="${ins.aac105 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼѪ��</td>
     <td>
       <e:text name="aac106" required="true"  defval="${ins.aac106 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
        <e:text name="aac107" required="true"  defval="${ins.aac107 }"/> 
     </td>
   </tr>
   <tr>
     <td>����</td>
     <td>
      <e:text name="aac108" required="true"  defval="${ins.aac108 }"/>  
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
      <e:text name="aac109" required="true"  defval="${ins.aac109 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
       <e:text name="aac110" required="true"  defval="${ins.aac110 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ʼ����</td>
     <td>
        <e:text name="aac111" required="true"  defval="${ins.aac111 }"/> 
     </td>
   </tr>
   
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aac101?'���':'�޸�' }"
              formaction="<%=path%>/${empty param.aac101?'add':'modify' }Hero.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryHero.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac101" value="${param.aac101 }">
<e:hidden name="qaac102"/>
</form>
</body>
</html>