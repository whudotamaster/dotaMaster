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
<form action="<%=path%>/findByIdAcc.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               ��Ʒ��Ϣ���
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">��Ʒ</td>
   </tr>
   <tr>
     <td>��Ʒ��</td>
     <td>
       <e:text name="aac602"  readonly="true"  defval="${ins.aac602 }"/> 
     </td>
   </tr>
   <tr>
     <td>��Ʒ����Ӣ��</td>
     <td>
       <e:text name="aac102"    readonly="true" defval="${ins.aac102 }"/>
     </td>
   </tr>
   
   <tr>
     <td>��ƷͼƬ</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:15%; height:100%">
     </td>
   </tr>  
  <tr>
     <td>���ռ۸�</td>
     <td>
       <e:text name="aac604"    readonly="true" defval="${ins.aac604 }"/> 
     </td>
   </tr>  
   <tr>
     <td>�һ��۸�</td>
     <td>
       <e:text name="aac605"    readonly="true" defval="${ins.aac605 }"/> 
     </td>
   </tr>  
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aab101 }">
</form>
</body>
</html>