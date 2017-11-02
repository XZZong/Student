package severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 17211L;
	private static Database dataBase;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("login");
		String password = request.getParameter("password");
		String role = request.getParameter("identityId");
		PrintWriter out = response.getWriter();
		User user = null;
		Student student = null;
		dataBase = new Database();
		if(role.equals("1")) {
			try {
				student = dataBase.searchStudent(name,password);
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			if(student != null) {
				response.setHeader("refresh", "1;url='info.jsp'");
				request.getSession().setAttribute("Student", student);
				return;
			}
		}
		else {
			try {
				user = dataBase.searchUser(name,password);			
			} catch (IllegalStateException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			if(user != null) {
				response.setHeader("refresh", "1;url='admi.jsp'");
				request.getSession().setAttribute("User", user);
				return;
			}	
		}	
		out.write("<script>");
		out.write("alert(\"用户名或密码或角色选择错误！\")");
		out.write("</script>");
		response.setHeader("refresh", "1;url='index.jsp'");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
