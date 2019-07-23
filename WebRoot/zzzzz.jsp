<%@ page language="java"  pageEncoding="GBK"%>
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<html >
<head >
<title>3*3 </title>

</head>
<style type="text/css">
    html,body { wider:100% ; height: 100%;margin: 0; padding: 0;}

*{margin:0 auto; text-align:center;}
#no{width:100%;height:100%;background:red;position:fixed;z-index:-1;}
.no{width:33.333333333333333333333333333333333%;height:33.333333333333333333333333333333333%;float:left;  background-size: 100% 100%;}
</style>
<body style="align:center;" onload="a('timg')">
<div id="no">
<div id="no0" class="no"></div>
<div id="no1" class="no"></div>
<div id="no2" class="no"></div>
<div style="wider:100% ; height: 100%;">
<div id="no3" class="no"></div>
<div id="no4" class="no"></div>
<div id="no5" class="no"></div>
<div style="wider:100% ; height: 100%;">
<div id="no6" class="no"></div>
<div id="no7" class="no"></div>
<div id="no8" class="no"></div>
</div>
</div>
</div>
<div>
<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1<br>1
</div>
</body>
<script>
function a(image)
{
	for(var i = 0 ; i<9;i++)
	{
	var id = "no" + i ;
		document.getElementById(id).style.backgroundImage="url(images/"+ image + "_" + i +".png)";	
	}
}
</script>
</html>