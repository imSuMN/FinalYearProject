package ProjLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//public class PasswordHashing { public static void main(String[] args) { System.out.println(doHashing("12345678")); }
/**
 * Servlet implementation class Register
 */
@WebServlet("/TempRegisterServlet")
public class TempRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	PrintWriter out=response.getWriter();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TempRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String uname = request.getParameter("name");
		String action = request.getParameter("action");

		RegisterDao rDao = new RegisterDao();
		if(action.equals("1")) {
			rDao.addPerm(uname);
		}
		else {
			rDao.removeTemp(uname);
		}
		out.print("1");

	}

}
