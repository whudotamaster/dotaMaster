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
<form action="<%=path%>/findByIdArticle.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
               ����${empty param.aab801?'���':'�Ķ�' }
       ${empty param.aab801 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����</td>
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
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryArticle.html"
              formnovalidate="formnovalidate">
     </c:if>
<<<<<<< HEAD
        <!-- ����Ա�ɼ���������ť -->
=======
 <!-- ����Ա�ɼ���������ť -->
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
		<c:if test="${aab108==2}">
			<input type="submit" name="next" value="����" 
              formaction="<%=path%>/adminQueryArticle.html"
              formnovalidate="formnovalidate">
			<input type="submit" name="pass" value="���ͨ��"
					formaction="<%=path%>/passArticle.html"
					formnovalidate="formnovalidate">
			<input type="submit" name="unpass" value="��˲�ͨ��"
					formaction="<%=path%>/unpassArticle.html"
					formnovalidate="formnovalidate">
		</c:if>

     </td>
   </tr>
<<<<<<< HEAD
   		<input type="hidden" name="aab801" value="${ins.aab801 }">  
=======
   		<input type="hidden" name="aab801" value="${ins.aab801 }">
   
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</table>
</form>
</body>
</html>