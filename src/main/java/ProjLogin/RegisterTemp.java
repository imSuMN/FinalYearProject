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

@WebServlet("/RegisterTemp")
public class RegisterTemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RegisterTemp() {
		super();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	public static String doHashing(String password) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(password.getBytes());
			byte[] resultByteArray = messageDigest.digest();
			StringBuilder sb = new StringBuilder();
			for (byte b : resultByteArray) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String uname = request.getParameter("name");
		String password = request.getParameter("pwd");
		String role=request.getParameter("role");
		String department=request.getParameter("dept");
		//password = doHashing(password);

		System.out.println(uname + ' ' + password);
		TempMember myuser = new TempMember(uname, password,role,department);

		RegisterDao rDao = new RegisterDao();
		String result = rDao.insertTemp(myuser);
		if (result == "Data entered successfully") {
			out.print("1");
		}

	}

}
