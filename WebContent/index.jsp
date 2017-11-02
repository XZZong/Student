<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
<link rel = "stylesheet" type = "text/css" href = "css/basic.css">
<link rel = "stylesheet" type = "text/css" href = "css/index.css">
<link rel = "stylesheet" type = "text/css" href = "css/news.css">
<link rel = "stylesheet" type = "text/css" href = "css/login.css">
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript" language = "JavaScript">
var text = 0, password = 0, vcode = 0, identity = 0;
function check(str,a) {
	if(str == "" || str == null) {
		a = a * 10 + a;
	}
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
		document.getElementById("msgtext").innerHTML = "请输入您的账号";
		break;
	case 2:
		password = 1;
		document.getElementById("msgpassword").innerHTML = "&nbsp;";
		break;
	case 22:
		document.getElementById("msgpassword").innerHTML = "请输入您的密码";
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
	function closeDialog() {
		$("#loginDialog").css('display','none');
		document.getElementById("msgtext").innerHTML = "&nbsp;";
		document.getElementById("msgpassword").innerHTML = "&nbsp;";
		document.getElementById("msgvcode").innerHTML = "&nbsp;";
		document.getElementById("vcode").innerHTML = "";
		for(i=0;i<document.all.tags("input").length;i++){   
	         document.all.tags("input")[i].value="";  
		}
	}
	function showLoginDialog() {
		$("#loginDialog").css('display','block');
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
	function radClick(a) {
		if(a == 1) {
			$('#stu').addClass('active').addClass('act');
			$('#school').removeClass('active').removeClass('act');
			identity = 1;
		}
		if(a == 2) {
			$('#school').addClass('active').addClass('act');
			$('#stu').removeClass('active').removeClass('act');
			identity = 2;
		}
	}
	function loginTest() {
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
		if(vcode == 0) {
			document.getElementById("msgvcode").innerHTML = "请输入图片验证码";
			flag = false;
		}
		else if(vcode == 2) {
			document.getElementById("msgvcode").innerHTML = "验证码错误";
			flag = false;
		}
		if(identity == 0) {
			document.getElementById("identity").innerHTML = "请选择登录身份";
			flag = false;
		}
		return flag;
	}
</script>
<style>
	.clearfix canvas {
		width: 80px;
		height: 42px;
		padding: 3px;
	}
</style>
</head>
<body onload="createCode()">
<div id = "topUserDiv" class = "ng-scope">
	<div class = "globalhead ng-scope">
		<div class = "wrap1130 clearfix top-nav">
		<a href = "index.jsp" class = "fl logo">
			<img src = "./images/logo.jpg">
		</a>
		<div class = "user fr">
			<span class = "ng-binding">
				<li class = "nav-btn">
					<a id = "btnShowLoginDialog" href = "#" onclick = "showLoginDialog();">登录</a>
				</li>
			</span>
		</div>
		</div>
	</div>
	<div class = "lq-news">
		<div class = "top-line"></div>
		<div class = "news-detail" id = "detail">
			<div class = "detail-t">
				<p class = "tag">武汉理工大学</p>
				<p class = "p2">武汉理工大学简介</p>
				<p class = "p3">2017-4-10</p>
			</div>
			<div class = "content">
				<div class = "news-text">
					<p><br></p>
					<p style = "text-align: left; margin-top: 5px; margin-bottom: 5px; line-height: 2em;">
						<span style = "font-family:微软雅黑, 'Microsoft YhHei'; font-size: 14px">
						&nbsp;&nbsp;&nbsp;武汉理工大学（Wuhan University of Technology，WUT），简称“武理工”，
						位于华中地区最大城市——湖北省武汉市，是中华人民共和国教育部直属的理工类全国重点大学，
						国家首批“211工程”、“特色985工程”重点建设高校，是“111计划”、“卓越工程师教育培养计划”、
						“海外高层次人才引进计划”、“国家建设高水平大学公派研究生项目”等重点建设的中国高水平研究型大学，
						由国家教育部、交通运输部、国家海洋局、国家国防科技工业局共建。<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
					</p>
					<p style = "text-align: left; margin-top: 5px; margin-bottom: 5px; line-height: 2em;">
						<span style = "font-family:微软雅黑, 'Microsoft YhHei'; font-size: 14px">
						&nbsp;&nbsp;&nbsp;武汉理工大学由分属教育部、交通部、中国汽车工业总公司的武汉工业大学、
						武汉交通科技大学、武汉汽车工业大学三校在2000年合并而成立，其办学源头最早可追溯到1898年清朝
						湖广总督张之洞创办的湖北工艺学堂。截止2014年4月，学校共有三个校区，占地面积4000余亩；
						校舍总建筑面积逾156万平方米，四座现代化图书馆藏书390余万册；在校本科生37300余人，
						博士、硕士生15000余人，外国留学生800余人<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
					</p>
					<p style = "text-align: left; margin-top: 5px; margin-bottom: 5px; line-height: 2em;">
						<span style = "font-family:微软雅黑, 'Microsoft YhHei'; font-size: 14px">
						&nbsp;&nbsp;&nbsp;在2014年《泰晤士报》发布的亚洲大学排行榜中，武汉理工大学位列中国大陆第九位
						 、亚洲第49位，进入《泰晤士高等教育》2013-2014年度世界大学前400名排行榜，位居301-350位，中国大陆第八位。<br>
						&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class = "login loginDialog" id = "loginDialog" style = "display:none;">
		<div class = "main">
			<p class = "t">登录</p>
			<img  src = "./images/close.png" id = "close" onclick = "closeDialog()">
			<form id = "loginform" action = "login" method = "post" onsubmit = "return loginTest()">
				<div class = "form">
					<div class = "form-group">
						<div class = "form-label clearfix right">
							<p class = "fl">账号</p>
						</div>
						<input type = "text" name="login" 
						placeholder="请输入您的账号" autocomplete="off" onblur = "check(this.value, 1);" >
						<p class="err">
							<span id = "msgtext">&nbsp;</span>
						</p>
					</div>
					<div class = "form-group">
						<div class = "form-label clearfix right">
							<p class = "fl">密码</p>
							<a href = "" class = "c-559ae2">忘记密码</a>
						</div>
						<input type = "password" name="password" 
						placeholder="请输入您的密码" autocomplete="off" onblur = "check(this.value, 2);" >
						<p class="err">
							<span id = "msgpassword">&nbsp;</span>
						</p>
					</div>
					<div class = "form-group">
						<div class="clearfix">
							<p>&nbsp;</p>
							<input type="text" id="vcode" name="vcode" placeholder="请输入图片验证码" class="code-input fl" onblur = "check(this.value, 4);">
							<canvas class="code-img fl" id = "myCanvas" onclick = "createCode();"></canvas>
							<a href="javascript:createCode();" class="code-link fl">看不清？换一张</a>
						</div>
						<p class="err">
							<span id = "msgvcode">&nbsp;</span>
						</p>
					</div>
					<div class = "form-group">
						<div class = "reg-way clearfix">
						<label class="school b-radius4" style="margin-right: 30px;" onclick = "radClick(2);" id = "school">
							我是管理员
							<input type="radio" name="identityId" value="2">
						</label>
						<label class="stu b-radius4" onclick = "radClick(1);" id = "stu">
							我是学生
							<input type="radio" name="identityId" value="1" style="text-align: right;">
						</label>
						</div>						
						<p class="err">
							<span id = "identity">&nbsp;</span>
						</p>
					</div>
					<button type="submit" class="sub mt10">登录</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>