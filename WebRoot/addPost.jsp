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
  
         .addPost{

                position:fixed;

                top: 0;

                left: 0;

                width:100%;

                height:100%;

                min-width: 1000px;

                z-index:-10;

                zoom: 1;

                background-color: #fff;

                background: url(images/addPost.png);

                background-repeat: no-repeat;

                background-size: cover;

                -webkit-background-size: cover;

                -o-background-size: cover;

                background-position: center 0;

            }
</style>

</head>
<body>
<div class="addPost"></div>
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" class="table table-striped" style="background-color:#a3a9a6;opacity: 0.95;width:55%">
   <c:choose>
   <c:when test="<%=aab101!=null %>">
      <tr>
	     <td width="100px">����</td>
	     <td>
	       <e:text name="apaab502"  required="true" defval=""/> 
	     </td>
	   </tr>
	    <tr>
	     <td width="100px">�ۿ�Ȩ��</td>
	     <td>
	       <e:select name="apaab507" value="����:0,1����Ա:1,2����Ա:2,3����Ա:3,4����Ա:4,5����Ա:5,����T:9" defval="0" />
	     </td>
	   </tr>
	   <tr>
     <td width="100px">����</td>
     <td>
    <!--     <e:textarea rows="5" cols="45" name="apaab503" required="true" defval=""/>
       -->
      <div id="editor" style="width:100%;background-color:#ffffff"></div>
   
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
     	  <c:choose>
  			 <c:when test="<%=aab101!=null %>">
  			  <input type="submit" name="next" value="���� "
              formaction="<%=path%>/addPost.html">
     </c:when>
     <c:otherwise>
       <input type="submit" name="next" value="��¼ "
              formaction="<%=path%>/login.html">
     </c:otherwise>
     </c:choose>
      <input type="submit" name="next" value="����"
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
 <input type="text" name="apaab503" id="apaab503" hidden="true">
 <e:hidden name="aab101" defval="<%=aab101 %>"/>
</form>
<%@ include file="footer.jsp" %>
</body>
    <script src="jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        var $text1 = $('#apaab503')
        editor.customConfig.onchange = function (html) {
            // ��ر仯��ͬ�����µ� textarea
            $text1.val(html)
        }
        if(${ins.aab107 > 200}){
        
       
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
        }
        else
        	{
        	  editor.customConfig.menus = [
        		    'bold',  // ����
        		    'fontSize',  // �ֺ�
        		    'foreColor',  // ������ɫ
        		];
        	}
        editor.create()
        // ��ʼ�� textarea ��ֵ
        $text1.val(editor.txt.html())
    </script>
</html>