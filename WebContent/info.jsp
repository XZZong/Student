<%@page import="manage.Student"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
<link rel = "stylesheet" type = "text/css" href = "css/basic.css">
<link rel = "stylesheet" type = "text/css" href = "css/show.css">
<link rel = "stylesheet" type = "text/css" href = "css/form.css">
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript" language = "JavaScript">
	var dmenu = true;
	function dropmenu() {
		if(dmenu) {
			$("#dropmenu").css('display','block');
			dmenu = false;
		}
		else {
			$("#dropmenu").css('display','none');
			dmenu = true;
		}
	}
	function logout() {
		var msg = "是否确定退出？\n\n请确认！";
		if (confirm(msg)==true){
			return true;
		}else{
			return false;
		}
	}
</script>
</head>
<body>
<%Student student = (Student)request.getSession().getAttribute("Student");
String studentID = student.getStudentID();
String studentName = student.getStudentName();
String className = student.getClassName();
boolean sex = student.isSex();
String xing = "女";
if(sex) 
	xing = "男";
String birth = student.getBirth();
String nation = student.getNation();
String entrance = student.getEntrance();
String specialty = student.getSpecialty();
%>
<div id = "topUserDiv" class = "ng-scope">
	<div class = "globalhead ng-scope">
		<div class = "wrap1130 clearfix top-nav">
		<a href = "info.jsp" class = "fl logo">
			<img src = "./images/logo.jpg">
		</a>
		<div class = "user fr">
			<span class = "ng-binding">
				<div class = "logined">
					<div class = "userinfo" onclick = "dropmenu();">
						<img class = "head-img" src = "./images/4.png">
						<span><%=studentName %></span>
						<img class = "dropicon" src = "./images/index-account-drop.png">
					</div>
					<div class = "dropmenu" id = "dropmenu" style = "display: none;">
						<div class = "arrow arrow1"></div>
						<div class = "arrow arrow2"></div>
						<ul class = "links">
							<li>
								<a href = "studentRePw.jsp">
									<img src = "./images/icon-safe.png">修改个人密码
								</a>
							</li>
							<li class = "quit">
								<a class = "logoutbtn" href = "index.jsp" onclick = "return logout()">
									<img src = "./images/userdrop-img4.png">退出
								</a>
							</li>
						</ul>
					</div>
				</div>
			</span>
		</div>
	    </div>
	</div>
</div>
<div class="wrap">
	<div class="clearfix">
		<div class="nav fl">
			<p class="center picture">
				<img src="./images/4.png" width="101" height="101"/>
				<span class="h3 c-333"><%=studentName %></span>
			</p>
			<ul activeleft="myauth" class = "ng-scope">
				<li id = "leftbar_myauth" class = "ng-scope active">
					<a href = "info.jsp">
						<img src = "./images/userdrop-img3.png">个人信息
					</a>
				</li>
				<li id = "leftbar_myscore" class = "ng-scope">
					<a href = "searchScore.jsp">
						<img src = "./images/userdrop-img2.png">成绩查询
					</a>
				</li>
			</ul>
			<div id="myTime">
				 <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
				 codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="200" height="80" id="honehoneclock" align="middle">
				 <param name="allowScriptAccess" value="always">
				 <param name="movie" value="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_wh.swf">
				 <param name="quality" value="high">
				 <param name="bgcolor" value="#ffffff">
				 <param name="wmode" value="transparent">
				 <embed wmode="transparent" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_wh.swf" 
				 quality="high" bgcolor="#ffffff" width="200" height="80" name="honehoneclock" align="middle" 
				 allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
				 </object>
			</div>
		</div>
		<div id = "authdiv4" class = "divR fl relative">
			<ul class = "nav-tab-a clearfix mr0">
				<li class = "act">个人信息</li>
			</ul>
			<div class = "tab-content tab-1">
				<div class = "block-5"></div>
				<div class = "showMain relative">
					<p class = "title">个人信息</p>
					<p>
						<span>学&emsp;&emsp;号</span>
						<ss ng-bind = "studentID" class = "ng-binding"><%=studentID %></ss>
					</p>
					<p>
						<span>姓&emsp;&emsp;名</span>
						<ss ng-bind = "studentName" class = "ng-binding"><%=studentName %></ss>
					</p>
					<p>
						<span>班&emsp;&emsp;级</span>
						<ss ng-bind = "className" class = "ng-binding"><%=className %></ss>
					</p>
					<p>
						<span>性&emsp;&emsp;别</span>
						<ss ng-bind = "sex" class = "ng-binding"><%=xing %></ss>
					</p>
					<p>
						<span>出&emsp;&emsp;生&emsp;&emsp;日&emsp;&emsp;期</span>
						<ss ng-bind = "birth" class = "ng-binding"><%=birth %></ss>
					</p>
					<p>
						<span>民&emsp;&emsp;族</span>
						<ss ng-bind = "nation" class = "ng-binding"><%=nation %></ss>
					</p>
					<p>
						<span>入&emsp;&emsp;学&emsp;&emsp;日&emsp;&emsp;期</span>
						<ss ng-bind = "entrance" class = "ng-binding"><%=entrance %></ss>
					</p>
					<p>
						<span>专&emsp;&emsp;业</span>
						<ss ng-bind = "specialty" class = "ng-binding"><%=specialty %></ss>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>