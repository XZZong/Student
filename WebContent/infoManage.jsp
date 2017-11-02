<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="manage.*"%>
<%@page import = "severlet.Database" %>
<%@page import = "java.util.Enumeration" %>
<%@page import="DAO.StudentDAO" %>
<%@ page import="java.util.List" %>
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
	function closeUpdate() {
		$("#updateDialog").css('display','none');
	}
	function showUpdate(r) {
		$("#updateDialog").css('display','block');
		var i=r.parentNode.parentNode.rowIndex;
		studentID = document.getElementById("studentInfo").rows[i].cells[0].innerText;
		studentName = document.getElementById("studentInfo").rows[i].cells[1].innerText;
		sex = document.getElementById("studentInfo").rows[i].cells[2].innerText;
		birth = document.getElementById("studentInfo").rows[i].cells[3].innerText;
		nation = document.getElementById("studentInfo").rows[i].cells[4].innerText;
		entrance = document.getElementById("studentInfo").rows[i].cells[5].innerText;
		className = document.getElementById("studentInfo").rows[i].cells[6].innerText;
		specialty = document.getElementById("studentInfo").rows[i].cells[7].innerText;
		document.getElementById("studentID").value = studentID;
		document.getElementById("studentName").value = studentName;
		document.getElementById("sex").value = sex;
		document.getElementById("birth").value = birth;
		document.getElementById("nation").value = nation;
		document.getElementById("entrance").value = entrance;
		document.getElementById("className").value = className;
		document.getElementById("specialty").value = specialty;
	}
	function deleteStudent(r) {
		var msg = "是否确定删除？\n\n请确认！";
		if (confirm(msg)== false)
			return;
		var i=r.parentNode.parentNode.rowIndex;
		studentID = document.getElementById("studentInfo").rows[i].cells[0].innerText;		
		document.form1.action= "deleteStudent?deleteID=" + studentID;
	    document.form1.submit();
	}
	function checkDate(date)
	{  
	     var result = date.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
	     if(result==null)
	     {
	         alert("请输入正确的日期格式");
	         return false;
	     }
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
</div>
<p>&nbsp;</p>
<div></div>
<div class = "dataTables_wrapper">				
	<div class = "dataTables_paginate">
		<label>
			<span class = "itemsPerPage" onclick = "showAdd();">添加新的学生信息</span>
		</label>
		<label>
			<span >查询: </span>
			<input type = "text" style = "width:120px;" id = "searchkey" placeholder = "search...">
		</label>
		<form name = "form1" method = "post"></form>
	</div>
	<table class = "display dTable" border = "0" cellspacing = "0" cellpadding = "0" id = "studentInfo">
		<thead>
			<tr>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						学号
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						姓名
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						性别
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						出生日期
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						民族
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						入学日期
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						班级
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper">
						专业
					</div>
				</th>
				<th class = "ui-state-default" style = "width:60px;" rowspan = "1" colspan = "1">
					<div class = "DataTables_sort_wrapper"></div>
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				List list = StudentDAO.getAll();
//			Database database = new Database();
//			Enumeration<Student> en;
//			en = database.searchStudent();
//			for(; en.hasMoreElements();) {
				for (Object object : list) {
//				Student student = en.nextElement();
					Student student = (Student) object;
					String sex = "";
					if (student.isSex())
						sex = "男";
					else
						sex = "女";
			%>
			<tr>
				<td><%=student.getStudentID() %>
				</td>
				<td><%=student.getStudentName() %>
				</td>
				<td><%=sex %>
				</td>
				<td><%=student.getBirth() %>
				</td>
				<td><%=student.getNation() %>
				</td>
				<td><%=student.getEntrance() %>
				</td>
				<td><%=student.getClassName() %>
				</td>
				<td><%=student.getSpecialty() %>
				</td>
				<td><a style="color:blue;cursor:pointer;" onclick="showUpdate(this);">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="color:blue;cursor:pointer;" onclick="deleteStudent(this);">删除</a></td>
			</tr>
			<%
				}
			%>																
		</tbody>
	</table>
</div>
<div class = "login loginDialog" id = "addDialog" style = "display:none;">
	<div class = "main">	
		<p class = "t" style = "font-size:20px;">添加新的学生信息</p>
		<img  src = "./images/close.png" id = "close1" onclick = "closeAdd()">
	 <form action="addStudent" method = "post"> 
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">学号</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "studentID">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">姓名</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "studentName">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">性别</label>
				<input type = "radio" class = "c-559ae2" style ="width:30px;" name = "sex" value="男">男
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" class = "c-559ae2" style ="width:30px;" name = "sex" value="女">女
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">出生日期</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "birth" placeholder = "格式：YYYY-MM-DD" onblur="checkDate(this.value);">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">民族</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "nation">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">入学日期</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "entrance" placeholder = "格式：YYYY-MM-DD" onblur="checkDate(this.value);">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">班级</label>
				<select name="className" class = "c-559ae2" style ="width:200px;">
					<option> </option>
					<%
					Database database1 = new Database();
					Enumeration<Classes> classes = database1.getAllClass();
					for(;classes.hasMoreElements();) {
						Classes cla = classes.nextElement();
						String className = cla.getClassName();
					%>
					<option><%=className %></option>
					<%
					}
					%>
				</select>			
				
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">专业</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "specialty">
			</div>
		</div>
		<button type="submit" class="sub mt10">添加</button>
	</form>
	</div>
</div>
<div class = "login loginDialog" id = "updateDialog" style = "display:none;">
	<div class = "main">	
		<p class = "t" style = "font-size:20px;">修改学生信息</p>
		<img  src = "./images/close.png" id = "close" onclick = "closeUpdate()">
		<form action="updateStudent" method = "post">
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">学号</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "studentID1" id = "studentID" readonly>
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">姓名</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "studentName1" id = "studentName">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">性别</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "sex1" id = "sex">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">出生日期</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "birth1" id = "birth" onblur="checkDate(this.value);">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">民族</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "nation1" id = "nation">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">入学日期</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "entrance1" id = "entrance" onblur="checkDate(this.value);">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">班级</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "className1" id = "className">
			</div>
			<p class="err">&nbsp;</p>
		</div>
		<div class = "form-group">
			<div class = "form-label clearfix right">
				<label class = "fl" style = "font-size:15px;">专业</label>
				<input type = "text" class = "c-559ae2" style ="width:200px;" name = "specialty1" id = "specialty">
			</div>
		</div>
		<button type="submit" class="sub mt10">修改</button>
	</form>
	</div>
</div>
</body>