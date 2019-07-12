<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <title>$Title$</title>
    <script>
        window.onload = function () {
            document.querySelector("#file").onchange = function () {
                var req = new XMLHttpRequest();
                var form = new FormData(document.getElementById("form1"));
//              form.append("file",document.querySelector("#file").files[0]);
                req.open("post", "${pageContext.request.contextPath}/upload", true);
                req.send(form);
                req.onload = function () {
                    document.getElementById("img").src = "${pageContext.request.contextPath}/pic/" + req.responseText;
                }
            }
        }
    </script>
</head>
<body>
<form id="form1" action="<%=path%>/uploadUser.htm" method="post" enctype="multipart/form-data">
   
    <input type="file" name="file" id="file">
    <input type="submit" name="next" id="file" value="submit">
</form>
</body>
</html>