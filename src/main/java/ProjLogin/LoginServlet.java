package ProjLogin;

//import java.io.IOException;

//import java.io.PrintWriter;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class LoginServlet
// */
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	
//	public static String doHashing (String password) { 
//		try { 
//			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
//			messageDigest.update(password.getBytes());
//			byte[] resultByteArray = messageDigest.digest();
//			StringBuilder sb = new StringBuilder();
//			for (byte b : resultByteArray) {
//				sb.append(String.format("%02x", b));
//			}
//			return sb.toString(); 
//		} 
//		catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//		return "";
//	} 
//	
//	
//       
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			//response.getWriter().println(request.getParameter("name"));
////			let regExp= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
////			'[a-z0-9]+@[a-z]+\.[a-z]{2,3}'
////	        /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
////	        let regExp= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
//			
////			let regExp1= /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}/;
////            <a class=" btn btn-light mx-2 " href="#">Sign Out</a>
//			
////			<script>
////			if(sessionStorage.getItem('uname')===null){
////				window.location='login.jsp';
////			}
////			let logout = document.getElementById('logout');
////			logout.addEventListener('click', logoutClickHandler)
////			
////			function logoutClickHandler(){
////				sessionStorage.clear();
////				window.location='login.jsp';
////			}
////			</script>
//
//			
//			PrintWriter out=response.getWriter();
//			response.setContentType("text/html");
//			
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fynalyearproject","root","Saumya@1234");
//			
//			String n=request.getParameter("name");
//			String p=request.getParameter("pwd");
//			
//			System.out.println(p);
//			
//			p=doHashing(p);
//			
//			System.out.println(p);
//			System.out.println(n);
//
//			
//			PreparedStatement ps=con.prepareStatement("select uname from myuser where uname=?");
//			ps.setString(1, n);
//			ResultSet rs=ps.executeQuery();
//			if(rs.next()) {
//				ps=con.prepareStatement("select uname from myuser where uname=? and password=?");
//				ps.setString(1, n);
//				ps.setString(2, p);
//				rs=ps.executeQuery();
//				if(rs.next()) {
////					RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
////					rd.forward(request, response);
//					out.print("1");
//				}
//				else {
//					out.println("0");
//				}
//			}
//			else {
//				out.print("-1");
//			}
//			
//		} catch(ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//}

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static Properties loadProperties() throws IOException {
		Properties properties = new Properties();

		// Load properties from the configsetting.properties file
		try (InputStream inputStream = LoginServlet.class.getClassLoader()
				.getResourceAsStream("configsetting.properties")) {
			if (inputStream != null) {
				properties.load(inputStream);

			} else {
				throw new IOException("Unable to locate the properties file.");
			}
		}

		return properties;
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
		try {
			// response.getWriter().println(request.getParameter("name"));
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			Properties properties = LoginServlet.loadProperties();
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalyearproject", "omra",
//					"root");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(properties.getProperty("dbUrl"),
					properties.getProperty("dbUname"), properties.getProperty("dbPassword"));

			String n = request.getParameter("name");
			String p = request.getParameter("pwd");

			System.out.println(p);

			p = doHashing(p);

			System.out.println(p);
			System.out.println(n);

			PreparedStatement ps = con.prepareStatement("select uname from myuser where uname=?");
			ps.setString(1, n);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ps = con.prepareStatement("select uname from myuser where uname=? and password=?");
				ps.setString(1, n);
				ps.setString(2, p);
				rs = ps.executeQuery();
				if (rs.next()) {
//					RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
//					rd.forward(request, response);
					session.setAttribute("user", n);
					out.print("1");
				} else {
					out.println("0");
				}
			} else {
				out.print("-1");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("server found");
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
