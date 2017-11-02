<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<link rel = "stylesheet" type = "text/css" href = "css/basic.css">
<link rel = "stylesheet" type = "text/css" href = "css/login.css">
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript" language = "JavaScript">
var text = 0, password = 0, repw = 0, vcode = 0;
	function check(str,a) {
		if(str == "" || str == null) {
			a = a * 10 + a;
		}
		if(a == 2 && (str.length <6 || str.length > 16))
			a = 21;
		if(a == 3 && str != document.getElementById("accountPassword").value)
			a = 31;
		if(a == 4 && str.length < 4) 
			a = 41;
		else if(a == 4 && str.length == 4) {
			if(str == code)	
				a = 42;
			else 
				a = 43;
		}
		switch(a){
		case 1:
			text = 1;
			document.getElementById("msgtext").innerHTML = "&nbsp;";
			break;
		case 11:
			document.getElementById("msgtext").innerHTML = "请输入原来的密码";
			break;
		case 2:
			password = 1;
			document.getElementById("msgpassword").innerHTML = "&nbsp;";
			break;
		case 21:
		case 22:
			document.getElementById("msgpassword").innerHTML = "新密码长度6-16位，数字、字母";
			break;
		case 3:
			repw = 1;
			document.getElementById("msgrepwd").innerHTML = "&nbsp;";
			break;
		case 31:
			repw = 2;
			document.getElementById("msgrepwd").innerHTML = "两次密码输入必须一致";
			break;
		case 33:
			document.getElementById("msgrepwd").innerHTML = "请再次输入新的密码";
			break;
		case 42:
			vcode = 1;
			document.getElementById("msgvcode").innerHTML = "&nbsp;";
			break;
		case 43:
			vcode = 2;
			document.getElementById("msgvcode").innerHTML = "验证码错误";
			break;
		case 41:
		case 44:
			document.getElementById("msgvcode").innerHTML = "请输入图片验证码";
			break;
			default: 
				break;
		}
	}
	function showCheck(a){/* 显示验证码图片 */
		var c = document.getElementById("myCanvas");
	 	var ctx = c.getContext("2d");
	 	ctx.clearRect(0,0,c.width,c.height);	
		ctx.font = "80px Arial";
		ctx.fillText(a,0,100);
	}
	var code ; //在全局 定义验证码      
	function createCode(){       
	    code = "";      
	    var codeLength = 4;//验证码的长度
	    var selectChar = new Array(1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');      
	          
	    for(var i=0;i<codeLength;i++) {
	       var charIndex = Math.floor(Math.random()*60);      
	      code +=selectChar[charIndex];
	    }      
	    if(code.length != codeLength){      
	      createCode();      
	    }
	    showCheck(code);
	    vcode = 2;
	}
	function change() {
		var flag = true;
		if(text == 0) {
			document.getElementById("msgtext").innerHTML = "请输入您的账号";
			alert("error");
			flag = false;
		}
		if(password == 0) {
			document.getElementById("msgpassword").innerHTML = "请输入您的密码";
			flag = false;
		}
		if(repw == 0) {
			document.getElementById("msgrepwd").innerHTML = "请再次输入新的密码";
			flag = false;
		}
		else if(repw == 2) {
			document.getElementById("msgrepwd").innerHTML = "两次密码输入必须一致";
			flag = false;
		}
		if(vcode == 0) {
			document.getElementById("msgvcode").innerHTML = "请输入图片验证码";
			flag = false;
		}
		else if(vcode == 2) {
			document.getElementById("msgvcode").innerHTML = "验证码错误";
			flag = false;
		}
		return flag;
	}
</script>
<style>
	.clearfix canvas {
		width: 80px;
		height: 42px;
	}
</style>
</head>
<body>
<body class = "reg-new">
	<div class = "reg-main">
		<div class = "reg-title">修改密码
		<a href = "admi.jsp"><img align = "right" src = "./images/close.png" id = "close"></a>	
		</div>		
		<form id = "regform" action = "updatepw" method = "post" onsubmit = "return change()">
			<div class = "form mt30">
				<input type = "text" id = "oldpassword" name="oldpassword" 
				placeholder="请输入原来的密码" autocomplete="off" onblur = "check(this.value, 1);" >
				<p class="err">
					<span id = "msgtext">&nbsp;</span>
				</p>
				<input type="password" id="accountPassword" name="accountPassword" 
				autocomplete="off" placeholder="新密码长度6-16位，数字、字母" onblur = "check(this.value, 2);">
				<p class="err">
					<span id = "msgpassword">&nbsp;</span>
				</p>
				<input type="password" name="repwd" id="repwd" 
				placeholder="请再次输入新的密码" onblur = "check(this.value, 3);">
				<p class="err">
					<span id = "msgrepwd">&nbsp;</span>
				</p>
				<div class="clearfix">
					<input type="text" id="vcode" name="vcode" placeholder="请输入图片验证码" class="code-input fl" onblur = "check(this.value, 4);">
					<canvas class="code-img fl" id = "myCanvas" onclick = "createCode();"></canvas>
					<a href="javascript:createCode();" class="code-link fl">看不清？换一张</a>
				</div>
				<p class="err">
					<span id = "msgvcode">&nbsp;</span>
				</p>				
				<button type="submit" class="sub">修改</button>
			</div>
		</form>
	</div>
</body>
</html>