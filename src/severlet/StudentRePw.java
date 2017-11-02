package severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.Student;

/**
 * Servlet implementation class StudentRePw
 */
@WebServlet("/studentRepw")
public class StudentRePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Database dataBase;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRePw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Student student = (Student)request.getSession().getAttribute("Student");
		String name = student.getStudentName();		
		String oldpassword = request.getParameter("oldpassword");
		String accountPassword = request.getParameter("accountPassword");
		PrintWriter out = response.getWriter();
		dataBase = new Database();
		try {
			boolean flag = dataBase.updateStuPw(name, oldpassword, accountPassword);
			if(flag) {
				out.write("<script>");
				out.write("alert(\"修改密码成功！\")");
				out.write("</script>");
				response.setHeader("refresh", "1;url='info.jsp'");
			}
			else {
				out.write("<script>");
				out.write("alert(\"修改密码失败！\")");
				out.write("</script>");	
				response.setHeader("refresh", "1;url='studentRePw.jsp'");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
