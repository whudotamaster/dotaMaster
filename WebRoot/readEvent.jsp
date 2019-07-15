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
${rows!=null }
<br>
<br>
<form action="<%=path%>/findByIdTeam.html" method="post" id="myform">
<table  border="1" align="center" width="45%">
    <caption>
               ���±�����Ϣ���
      <hr width="160">
    </caption>
    <tr>
     <td colspan="2">����</td>
   </tr>
   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
	    <c:forEach items="${rows }" var="ins" varStatus="vs">
	    <tr>
           <td>������</td>
            <td>
            <e:text name="aac702"   readonly="true"  required="true"  defval="${ins.aac702 }"/> 
            </td>
            <td>������ʼʱ��</td>
            <td>
            <e:text name="aac1102"   readonly="true"  required="true"  defval="${ins.aac1102 }"/>
            </td>
            <td>ս��1����</td>
            <td >
		    <!-- #  ��ê -->
			<!-- # <a  href="#" onclick="onEdit('${ins.aac901}')">${ins.aac1103 }</a>-->
			<e:text name="aac1103"   readonly="true"  required="true"  defval="${ins.aac1103 }"/>
		    </td> 
            <td>ս��2����</td>
            <td >
		    <!-- #  ��ê -->
			<!-- <a  href="#" onclick="onEdit('${ins.aac901}')">${ins.aac1104 }</a>-->
			<e:text name="aac1104"   readonly="true"  required="true"  defval="${ins.aac1104 }"/>
		    </td> 
            <td>ʤ��</td>
            <td>
            <e:text name="aac1105"   readonly="true"  required="true"  defval="${ins.aac1105 }"/>
           </td>
            <td>
             <e:text name="fvalue"  required="true"  readonly="true" defval="${ins.fvalue }"/> 
            </td>
        </tr>   
        </c:forEach>
        </c:when>
   </c:choose>
 
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryEvent.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
<script type="text/javascript">
    
      function onEdit(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }
     
   </script>  
</html>