package severlet;

import DAO.StudentDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/addStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 5825L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String studentID = request.getParameter("studentID");
		String studentName = request.getParameter("studentName");
		String xing = request.getParameter("sex");
		boolean sex = false;
		if(xing.equals("男"))
			sex = true;
		String className = request.getParameter("className");
		String birth = request.getParameter("birth");
		String nation = request.getParameter("nation");
		String entrance = request.getParameter("entrance");
		String specialty = request.getParameter("specialty");
		PrintWriter out = response.getWriter();
		try {
			boolean flag = StudentDAO.insertStudent(studentID,studentName,className,sex,birth,nation,entrance,specialty);
			out.write("<script>");
			if(flag) {				
				out.write("alert(\"Add student successfully\")");
			}
			else {
				out.write("alert(\"Fail !!!!\")");
			}
			out.write("</script>");	
			response.setHeader("refresh", "1;url='infoManage.jsp'");
		} catch (IllegalStateException e) {
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
