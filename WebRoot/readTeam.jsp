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
<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
<table  border="1" align="center" width="45%">
    <caption>
              ս�Ӽ���Ա��Ϣ${aab108!=2?'��ѯ':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">ս��</td>
   </tr>
   <tr>
     <td>ս����</td>
     <td>
       <e:text name="aac902"  readonly="${aab108!=2}"  required="true"  defval="${rows[0].aac902 }"/> 
     </td>
   </tr>
   <c:if test="${aab108!=2}">
   <tr>
     <td>ս��ͼƬ</td>
     <td >
      <img alt="no image" src=<%=path%>/images/${rows[0].aac903 } style="width:12%; height:100%">
     </td>
   </tr>  
   </c:if>
   <c:if test="${aab108==2}" >
   <tr>
     <td>ս��ͼƬ����</td>
     <td >
       <img alt="no image" src=<%=path%>/images/${rows[0].aac903 } style="width:12%; height:100%" >
       <c:if test="${aab108==2}" >
       <e:text name="aac903"  required="true"  defval="${rows[0].aac903 }" />
       </c:if>
     </td>
   </tr>  
   </c:if>
    <tr>
     <td>ս�Ӽ��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac904" defval="${rows[0].aac904 }"/>
     </td>
   </tr>
    <c:if test="${aab108==2}" >  
    <td>  
        <input type="submit" name="next" value="ս���޸�" formaction="<%=path%>/modifyTeam.html" formnovalidate="formnovalidate" >      
   </td>
   </c:if test="${aab108==2}">
   <tr>
    <tr>
     <td colspan="2">��Ա</td>
   </tr>
   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    <tr>
           <td>ѡ����</td>
            <c:if test="${aab108!=2}" >
            <td>
            <e:text name="aac1002"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac1002 }"/> 
            </td>
            </c:if>
            <c:if test="${aab108==2}" >
            <td >
		    <!-- #  ��ê -->
			<a  href="#" onclick="onEdit('${ins.aac1001}')">${ins.aac1002 }</a>
		    </td>  
		    </c:if>
        </tr>  
         <tr>
         <td>ѡ��ͷ��</td>
         <td>
           <img alt="no image" src=<%=path%>/images/${ins.aac1004 } style="width:12%; height:100%" >
           <c:if test="${aab108==2}" >
           <e:text name="aac1004"   readonly="${aab108!=2}"  required="true"  defval="${ins.aac1004 }" /> 
           </c:if>
          </td>
          </tr>  
	       </c:forEach>
         </c:when>
   </c:choose>
 
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryTeam.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac901" value="${param.aac901 }">
</form>
</body>
<script type="text/javascript">
    
      function onEdit(vaac1001)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPlayer.html?aac1001="+vaac1001;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>  
</html>