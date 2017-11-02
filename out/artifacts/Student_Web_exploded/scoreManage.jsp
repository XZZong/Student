<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="manage.*"%>
<%@page import = "severlet.Database" %>
<%@page import = "java.util.Enumeration" %>
<%@page import = "java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
<link rel = "stylesheet" type = "text/css" href = "css/datatable.css">
<link rel = "stylesheet" type = "text/css" href = "css/basic.css">
<link rel = "stylesheet" type = "text/css" href = "css/index.css">
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
	function closeAdd() {
		$("#addDialog").css('display','none');
		for(i=0;i<document.all.tags("input").length;i++){   
	         document.all.tags("input")[i].value="";  
		}
	}
	function showAdd() {
		$("#addDialog").css('display','block');
	}
	$(document).ready(function(){
		      $("#searchkey").keyup(
		        function(){
			      var string = $("#searchkey").val();
			      var regu = "^[ ]+$";
			      var re = new RegExp(regu);
				  if(string == "" || string == null || re.test(string)) {
					  $("table tr:gt(0)").show();
					  return;
				  }      
		          $("table tr:gt(0)").hide();
		          var $d = $("table tr:gt(0)").filter(":contains('"+$.trim($("#searchkey").val())+"')");
		          $d.show();                   
		        }
		      )
		    }) 
</script>
</head>
<body>
<% User user = (User)request.getSession().getAttribute("User");
String name = user.getname();
%>
<div id = "topUserDiv" class = "ng-scope">
	<div class = "globalhead ng-scope">
		<div class = "wrap1130 clearfix top-nav">
		<a href = "index.jsp" class = "fl logo">
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
								<a href = "">
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
</div>
<p>&nbsp;</p>
<div class = "dataTables_wrapper" style = "width:680px;font-size:14px;position:absolute;left:50%;margin-left:-340px;">				
	<div class = "dataTables_paginate">
		<label>
			<span class = "itemsPerPage" onclick = "showAdd();">添加成绩</span>
		</label>
		<label>
			<span >查询: </span>
			<input type = "text" style = "width:120px;" id = "searchkey" placeholder = "search...">
		</label>			
	</div>
	<table class = "display dTable" border = "0" cellspacing = "0" cellpadding = "0" id = "classInfo">
		<thead>
			<tr>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						学号
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						课程
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						学年
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						学期
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						成绩
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<%
			Database database = new Database();
			DecimalFormat df = new DecimalFormat("0.00");
			Enumeration<Score> en;
			en = database.searchScore();
			for(; en.hasMoreElements();) {
				Score score1 = en.nextElement();
				String score = df.format(score1.getScore());
				String semester = Integer.toString(score1.getSemester());
			%>
				<tr>
					<td><%=score1.getStudentID() %></td>
					<td><%=score1.getCourseName() %></td>
					<td><%=score1.getYear() %></td>	
					<td><%=semester%></td>	
					<td><%=score %></td>				
				</tr>
			<%
			}
			%>																
		</tbody>
	</table>
</div>
<div class = "login loginDialog" id = "addDialog" style = "display:none;">
	<div class = "main">	
		<p class = "t" style = "font-size:20px;">添加成绩</p>
		<img  src = "./images/close.png" id = "close" onclick = "closeAdd()">
	 <form action="addScore" method = "post"> 
	 <div class = "form">
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">学号</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "studentID">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">课程</label>
				<select name="courseName" class = "c-559ae2" style ="width:200px;">
					<option> </option>
					<%
					Database database1 = new Database();
					Enumeration<Course> course = database1.getAllCourse(); 
					for(;course.hasMoreElements();) {
						Course cou = course.nextElement();
						String courseName = cou.getCourseName();
					%>
					<option><%=courseName %></option>
					<%
					}
					%>
				</select>
			<!--	<input type = "text" class = "c-559ae2" style ="width:200px;" name = "courseName"> -->
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">学年</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "year" placeholder = "格式：YYYY-YYYY">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">学期</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "semester" placeholder = "填1或2">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">成绩</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "score">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<button type="submit" class="sub mt10">添加</button>
	</div>
	</form>
	</div>
</div>
</body>