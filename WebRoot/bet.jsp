<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <style>
    *{
      margin: 0;
      padding: 0;
    }

    #container{
      width: 100%;
    }
    #list-item{
      width: 700px;
      margin: 20px auto;
      border: 2px #D3D3D3  solid;
      box-sizing: border-box;
      padding: 5px 0 20px;
    }
    #list-item:hover{
      border-image: linear-gradient(45deg,aqua,blue) 2 2 2 2;
    }
    .header{
      text-align: center;
    }
    .flex-container{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-around;
      height: 250px;
    }
    .body{
      display: flex;
      flex-direction: row;
      justify-content: center;
    }
    .left{
      flex: 1;
    }
    .mid{
      width: 200px;
    }
    .right{
      flex: 1;
    }
    .item-img{
      width: 100px;
      height: 100px;
    }
    .my-input{
      width: 50px;
    }
    .bet-btn{
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: red;
      color: white;
      font-size: 15px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      outline: none;
      border: none;
    }
    .vs{
      font-size: 50px;
    }
  </style>
</head>
<body>
<input type="button" value="button" onclick="show()">
  <div id="container">
    <div id="list-item" style="display: none">
      <div class="header">2019-07-06</div>
      <div class="body">
        <div class="left">
          <form action="" class="flex-container" >
            <img src="http://tvax3.sinaimg.cn/crop.15.0.403.403.1024/e9e0e507ly8fu39gpqh8tj20bn0b775e.jpg" alt="VG" class="item-img">
            <p>VG</p>
            <p>下注量：3033</p>
            <div>我要下注：<input type="text" class="my-input" name="myBet" value="0"></div>
            <input type="submit" class="bet-btn" value="下注">
            <input name="gameId" value="" style="display: none">
            <input name="team" value="" style="display: none">
          </form>
        </div>
        <div class="mid flex-container">
          <p class="vs">VS</p>
          <p> 16:30</p>
        </div>
        <div class="right">
          <form action="" class="flex-container">
            <img src="http://01.imgmini.eastday.com/mobile/20180413/20180413210854_5981ee25d426a7282b09ae4f344f9adc_2.jpeg" alt="VG" class="item-img">
            <p>LGD</p>
            <p>下注量：2200</p>
            <div>我要下注：<input type="text" class="my-input" name="myBet" value="0"></div>
            <input type="submit" class="bet-btn" value="下注">
            <input name="gameId" value="" style="display: none">
            <input name="team" value="" style="display: none">
          </form>
        </div>
      </div>
    </div>
  </div>
  <script>
    var list = [
        {
            id:1,
            team1:'VG',
            team2:'LGD',
            team1Id:'',
            team2Id:'',
            logo1:'http://tvax3.sinaimg.cn/crop.15.0.403.403.1024/e9e0e507ly8fu39gpqh8tj20bn0b775e.jpg',
            logo2:'http://01.imgmini.eastday.com/mobile/20180413/20180413210854_5981ee25d426a7282b09ae4f344f9adc_2.jpeg',
            date:'2019-07-06',
            time:'14:30',
            amount1:'3033',
            amount2:'2200',
        },
        {
            id:1,
            team1:'VG',
            team2:'LGD',
            team1Id:'',
            team2Id:'',
            logo1:'http://tvax3.sinaimg.cn/crop.15.0.403.403.1024/e9e0e507ly8fu39gpqh8tj20bn0b775e.jpg?Expires=1563011585&ssig=PjtwWiOyQM&KID=imgbed,tva',
            logo2:'http://01.imgmini.eastday.com/mobile/20180413/20180413210854_5981ee25d426a7282b09ae4f344f9adc_2.jpeg',
            date:'2019-07-06',
            time:'14:30',
            amount1:'3033',
            amount2:'2200',
        },
        {
            id:1,
            team1:'VG',
            team2:'LGD',
            team1Id:'',
            team2Id:'',
            logo1:'http://tvax3.sinaimg.cn/crop.15.0.403.403.1024/e9e0e507ly8fu39gpqh8tj20bn0b775e.jpg?Expires=1563011585&ssig=PjtwWiOyQM&KID=imgbed,tva',
            logo2:'http://01.imgmini.eastday.com/mobile/20180413/20180413210854_5981ee25d426a7282b09ae4f344f9adc_2.jpeg',
            date:'2019-07-06',
            time:'14:30',
            amount1:'3033',
            amount2:'2200',
        }
    ];
    
    
	function show(){
	    obj = document.getElementsByName("idlist");
	    check_val = [];
	    for(k in obj){
	        if(obj[k].checked)
	            check_val.push(obj[k].value);
	    }
	    alert(check_val);
	    var userList = "${rows}";
	    alert(userList);
	}
	
    var listItem = document.getElementById('list-item');
    var container = document.getElementById('container');
    list.forEach(item=>{
        var myItem = listItem.cloneNode(true);
        console.log(myItem);
        myItem.style.display = 'block';
        myItem.childNodes[1].innerHTML = item.date;
        myItem.childNodes[3].childNodes[1].childNodes[1].childNodes[1].src = item.logo1;
        myItem.childNodes[3].childNodes[1].childNodes[1].childNodes[3].innerHTML = item.team1;
        myItem.childNodes[3].childNodes[1].childNodes[1].childNodes[5].innerHTML = '下注量：'+item.amount1;
        myItem.childNodes[3].childNodes[1].childNodes[1].childNodes[11].value = item.id;
        myItem.childNodes[3].childNodes[1].childNodes[1].childNodes[13].value = 1;
        myItem.childNodes[3].childNodes[3].childNodes[3].innerHTML = item.time;
        myItem.childNodes[3].childNodes[5].childNodes[1].childNodes[1].src = item.logo2;
        myItem.childNodes[3].childNodes[5].childNodes[1].childNodes[3].innerHTML = item.team2;
        myItem.childNodes[3].childNodes[5].childNodes[1].childNodes[5].innerHTML = '下注量：'+item.amount2;
        myItem.childNodes[3].childNodes[5].childNodes[1].childNodes[11].value = item.id;
        myItem.childNodes[3].childNodes[5].childNodes[1].childNodes[13].value = 2;
        container.appendChild(myItem);
    })
  </script>
  
</body>
</html>