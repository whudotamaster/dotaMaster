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
${msg }
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       ����
       ${empty param.aab101 }
      <hr width="160">
    </caption>
   <c:choose>
   <c:when test="${!empty param.aab101 }">
      <tr>
	     <td>����</td>
	     <td>
	       <e:text name="apaab502"  required="true" defval=""/> 
	     </td>
	   </tr>
	   <tr>
     <td>����</td>
     <td>
    <!--     <e:textarea rows="5" cols="45" name="apaab503" required="true" defval=""/>
       -->
      <div id="editor"></div>
   
     </td>
   </tr>
   </c:when>
<c:otherwise>
<tr>
<td>
	��û�е�¼���ܷ���
	</td>
	</tr>
</c:otherwise>
</c:choose>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'��¼':'����' }"
              formaction="<%=path%>/${empty param.aab101?'login':'addPost' }.html?aab101=${param.aab101 }">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html?aab101=${param.aab101 }"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
 <input type="text" name="apaab503" id="apaab503" hidden="true">
</form>

</body>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        var $text1 = $('#apaab503')
        editor.customConfig.onchange = function (html) {
            // ��ر仯��ͬ�����µ� textarea
            $text1.val(html)
        }
        
        editor.customConfig.menus = [
    'head',  // ����
    'bold',  // ����
    'fontSize',  // �ֺ�
    'fontName',  // ����
    'italic',  // б��
    'underline',  // �»���
    'strikeThrough',  // ɾ����
    'foreColor',  // ������ɫ
    'backColor',  // ������ɫ
    'list',  // �б�
    'justify',  // ���뷽ʽ
];
        editor.create()
        // ��ʼ�� textarea ��ֵ
        $text1.val(editor.txt.html())
    </script>
</html>