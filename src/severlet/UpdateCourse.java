package severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/updateCourse")
public class UpdateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Database dataBase;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourse() {
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
		String courseName = request.getParameter("courseName1");
		String credit1 = request.getParameter("credit1");
		float credit = (float)Double.parseDouble(credit1);
		PrintWriter out = response.getWriter();
		dataBase = new Database();
		try {
			boolean flag = dataBase.updateCourse(courseName, credit);
			out.write("<script>");
			if(flag) {				
				out.write("alert(\"�޸Ŀγ̳ɹ���\")");							
			}
			else {
				out.write("alert(\"�޸Ŀγ�ʧ�ܣ�\")");
			}
			out.write("</script>");	
			response.setHeader("refresh", "1;url='courseManage.jsp'");
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
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
