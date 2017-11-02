<%@page import="manage.Student"%>
<%@page import = "severlet.Database" %>
<%@page import = "java.util.Enumeration" %>
<%@page import = "manage.Score" %>
<%@page import = "java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
<link rel = "stylesheet" type = "text/css" href = "css/datatable.css">
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
String studentName = student.getStudentName();
String studentID = student.getStudentID();
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
				<li id = "leftbar_myauth" class = "ng-scope">
					<a href = "info.jsp">
						<img src = "./images/userdrop-img3.png">个人信息
					</a>
				</li>
				<li id = "leftbar_myscore" class = "ng-scope active">
					<a href = "">
						<img src = "./images/userdrop-img2.png">成绩查询
					</a>
				</li>
			</ul>
			<div id="myTime" >
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
			<div class = "dataTables_wrapper" style = "width:580px;">				
				<table class = "display dTable" border = "0" cellspacing = "0" cellpadding = "0">
					<thead>
						<tr>
							<th class = "ui-state-default" style = "width:150px;" rowspan = "1" colspan = "1">
								<div class = "DataTables_sort_wrapper">
									课程
								</div>
							</th>
							<th class = "ui-state-default" style = "width:150px;" rowspan = "1" colspan = "1">
								<div class = "DataTables_sort_wrapper">
									学年
								</div>
							</th>
							<th class = "ui-state-default" style = "width:150px;" rowspan = "1" colspan = "1">
								<div class = "DataTables_sort_wrapper">
									学期
								</div>
							</th>
							<th class = "ui-state-default" style = "width:150px;" rowspan = "1" colspan = "1">
								<div class = "DataTables_sort_wrapper">
									分数
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<%
						Database database = new Database();
						DecimalFormat df = new DecimalFormat("0.00");
						Enumeration<Score> en;
						en = database.searchStudentScore(studentID);
						int i = 1;
						for(; en.hasMoreElements();) {
							Score score1 = en.nextElement();
							String score = df.format(score1.getScore());
							String semester = Integer.toString(score1.getSemester());
							if(i % 2 == 0) {
						%>
								<tr class = "even">
									<td><%=score1.getCourseName() %></td>
									<td><%=score1.getYear() %></td>
									<td><%=semester %></td>
									<td class = "center"><%=score %></td>
								</tr>
						<%
							}
							else {
						%>
								<tr class = "odd">
									<td><%=score1.getCourseName() %></td>
									<td><%=score1.getYear() %></td>
									<td><%=semester %></td>
									<td class = "center"><%=score %></td>
								</tr>
						<%
							}
						}
						%>																
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>