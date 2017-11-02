<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>js增删改 v1.0</title>
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript">  
function check(date)
{  
     var result = date.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
     if(result==null)
     {
         alert("请输入正确的日期格式");
         return false;
     }
}
function get() {
	document.getElementsByName("sex").value= "女";
}
</script> 
</head>
<body >
<div>
   <input type="text" id="txtName" onblur="check(this.value);"/>
<input type = "radio" style ="width:80px;" name = "sex" value="男" checked="checked">男
<input type = "radio" style ="width:80px;" name = "sex" value="女">女
<input type="button" onclick="get()">
</div>
</body>
</html>