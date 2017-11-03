package severlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentDAO;
import manage.Student;

/**
 * Servlet implementation class StudentRePw
 */
@WebServlet("/studentRepw")
public class StudentRePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
        boolean flag = StudentDAO.updatePwd(name, oldpassword, accountPassword);
        if (flag) {
            out.write("<script>");
            out.write("alert(\"Change password successfully\")");
            out.write("</script>");
            response.sendRedirect(request.getContextPath() + "/info.jsp");
        } else {
            out.write("<script>");
            out.write("alert(\"Fail to change password\")");
            out.write("</script>");
            response.sendRedirect(request.getContextPath() + "/studentRePw.jsp");
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
