<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
<script type="text/javascript">
var imgcontentStr = ''��
$("#aac505").on("change", function () {
        var file = $("#aac505")[0].files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onloadend = function (e) {
            if (reader.error) {
                console.log(reader.error);
            } else {
            //�ж�ͼƬ��С����1M������ѹ��
                if (file.size > 1048576) {
                    var img = new Image,
                        quality = 1, //image quality
                        canvas = document.createElement("canvas"),
                        drawer = canvas.getContext("2d");
                    img.src = reader.result;
                    img.onload = function () {
                        var scale = parseInt(file.size / 1048576);
                        var width = parseInt(img.width / scale);
                        canvas.width = width;
                        canvas.height = width * (img.height / img.width);
                        drawer.drawImage(img, 0, 0, canvas.width, canvas.height);
                        var result = canvas.toDataURL("image/jpeg", quality);
                        $(".img").prop("src", result)
                        imgcontentStr = result;
                    }
                } else {
                    var result = reader.result;
                    $(".img").prop("src", result)
                    $(".img").css("display", "inline-block")
                    imgcontentStr = result;
                }
            }
        }
    })
    
    $("#Btn").on("click", function () {
        var data = $.param({
            imgcontent: imgcontentStr
        });
        $.ajax({
            url: url,
            type: "post",
            data: data,
            dataType: "json",
            success: function (result) {
                if (result.rspcode == 1000) {
                    alert("�ύ�ɹ�")
                } else {
                    alert("�ύʧ��")
                }
            }
        })
        return false;
    });
</script>
</head>
<body>
${msg}
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
                װ��${empty param.aac501?'���':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">װ������</td>
   </tr>
   <tr>
     <td>װ����</td>
     <td>
       <e:text name="aac502" required="true" autofocus="true" defval="${ins.aac502 }"/> 
     </td>
   </tr>
   <c:if test="${empty param.aac501 }">
   <tr>
     <td>װ��ͼƬ</td>
     <td>
       <e:text name="aac505"    defval="${ins.aac505 }"/>     
     </td>
   </tr>  
   </c:if>
   <c:if test="${!empty param.aac501 }">
   <tr>
     <td>װ��ͼƬ</td>
     <td>
       <e:text name="aac505"  readonly="true"   defval="${ins.aac505 }"/> 
     </td>
   </tr>  
   </c:if>
   <tr>
     <td>װ���۸�</td>
     <td>
       <e:text name="aac503"  required="true" defval="${ins.aac503 }"/> 
     </td>
   </tr>   
   <tr>
     <td>װ��Ч��</td>
     <td>
       <e:textarea rows="5" cols="45" name="aac504" defval="${ins.aac504 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aac501?'���':'�޸�' }" class="btn" id="btn"
              formaction="<%=path%>/${empty param.aac501?'add':'modify' }Equipment.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryEquipment.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aac501" value="${param.aac501 }">
<input type= name="aac505" value="${param.aac505 }">
</form>
</body>
</html>