package severlet;

import DAO.StudentDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStudent
 */
@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 73845L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudent() {
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
		String studentID = request.getParameter("studentID1");
		String studentName = request.getParameter("studentName1");
		String xing = request.getParameter("sex1");
		boolean sex = false;
		if(xing.equals("男"))
			sex = true;
		String className = request.getParameter("className1");
		String birth = request.getParameter("birth1");
		String nation = request.getParameter("nation1");
		String entrance = request.getParameter("entrance1");
		String specialty = request.getParameter("specialty1");
		PrintWriter out = response.getWriter();
		try {
            boolean flag = StudentDAO.updateStudent(studentID,studentName,className,sex,birth,nation,entrance,specialty);
			out.write("<script>");
			if(flag) {				
				out.write("alert(\"update student information successfully\")");
			}
			else {
				out.write("alert(\"Fail to update\")");
			}
			out.write("</script>");
			response.sendRedirect(request.getContextPath() + "/infoManage.jsp");
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
