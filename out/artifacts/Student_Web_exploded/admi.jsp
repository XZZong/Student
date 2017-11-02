<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="manage.User"%>
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
<% User user = (User)request.getSession().getAttribute("User");
String name = user.getname();
%>
<div id = "topUserDiv" class = "ng-scope">
	<div class = "globalhead ng-scope">
		<div class = "wrap1130 clearfix top-nav">
		<a href = "admi.jsp" class = "fl logo">
			<img src = "./images/logo.jpg">
		</a>
		<ul class = "fl navigation">
			<li>
				<a href = "infoManage.jsp">学生信息管理</a>
			</li>
			<li>
				<a href = "classManage.jsp">班级管理</a>
			</li>
			<li>
				<a href = "courseManage.jsp">课程管理</a>
			</li>
			<li>
				<a href = "scoreManage.jsp">成绩管理</a>
			</li>
		</ul>
		<div class = "user fr">
			<span class = "ng-binding">
				<div class = "logined">
					<div class = "userinfo" onclick = "dropmenu();">
						<img class = "head-img" src = "./images/4.png" >
						<span><%=name %></span>
						<img class = "dropicon" src = "./images/index-account-drop.png">
					</div>
					<div class = "dropmenu"  id = "dropmenu" style = "display: none;">
						<div class = "arrow arrow1"></div>
						<div class = "arrow arrow2"></div>
						<ul class = "links">
							<li>
								<a href = "adRePw.jsp">
									<img src = "./images/icon-safe.png">修改个人密码
								</a>
							</li>
							<li>
								<a href = "addAdmi.jsp">
									<img src = "./images/userdrop-img1.png">添加管理员
								</a>
							</li>
							<li class = "quit">
								<a class = "logoutbtn"  href = "index.jsp" onclick = "return logout()">
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
</div>
</body>
</html>