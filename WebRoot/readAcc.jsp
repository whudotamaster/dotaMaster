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
       <e:text name="aac602"  readonly="${aab108!=2}"  required="true"  defval="${ins.aac602 }"/> 
     </td>
   </tr>
   <tr>
     <td>��Ʒ����Ӣ��</td>
     <td>
       <e:text name="aac101"    readonly="${aab108!=2}" required="true" defval="${ins.aac101 }"/>
     </td>
   </tr>
   <c:if test="${aab108!=2}">
   <tr>
     <td>��ƷͼƬ</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${ins.aac603 } style="width:15%; height:100%">
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108==2}" >
   <tr>
     <td>��ƷͼƬ����</td>
     <td >
       <e:text name="aac603"  required="true"  defval="${ins.aac603 }" />
     </td>
   </tr>  
   </c:if>
  <tr>
     <td>���ռ۸�</td>
     <td>
       <e:text name="aac604"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac604 }"/> 
     </td>
   </tr>  
   <tr>
     <td>�һ��۸�</td>
     <td>
       <e:text name="aac605"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac605 }"/> 
     </td>
   </tr>  
   <tr>
     <td>���</td>
     <td>
       <e:text name="aac606"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac606 }"/> 
     </td>
   </tr> 
   <tr>
     <td colspan="2" align="center">
       <c:if test="${aab108==2}">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/findForBuyAcc.html"
              formnovalidate="formnovalidate">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/findForSellAcc.html"
              formnovalidate="formnovalidate">
       </c:if>       
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryAcc.html"
              formnovalidate="formnovalidate">
        <c:if test="${aab108==2}" >      
        <input type="submit" name="next" value="�޸�" formaction="<%=path%>/modifyAcc.html" formnovalidate="formnovalidate" >  
       </c:if>
     </td>
   </tr>
</table>
<input type="hidden" name="aac601" value="${param.aac601 }">
<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
</body>
</html>