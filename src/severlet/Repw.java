package severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.User;

/**
 * Servlet implementation class Repw
 */
@WebServlet("/updatepw")
public class Repw extends HttpServlet {
	private static final long serialVersionUID = 1242L;
	private static Database dataBase;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Repw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		User user = (User)request.getSession().getAttribute("User");
		String name = user.getname();		
		String oldpassword = request.getParameter("oldpassword");
		String accountPassword = request.getParameter("accountPassword");
		PrintWriter out = response.getWriter();
		dataBase = new Database();
		try {
			boolean flag = dataBase.updateUser(name, oldpassword, accountPassword);
			if(flag) {
				out.write("<script>");
				out.write("alert(\"修改密码成功！\")");
				out.write("</script>");
				response.setHeader("refresh", "1;url='admi.jsp'");
			}
			else {
				out.write("<script>");
				out.write("alert(\"修改密码失败！\")");
				out.write("</script>");	
				response.setHeader("refresh", "1;url='adRePw.jsp'");
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
