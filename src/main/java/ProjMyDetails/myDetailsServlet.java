package ProjMyDetails;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class myDetailsServlet
 */
@WebServlet("/myDetailsServlet")
public class myDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myDetailsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("fetching");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public static String convert(String[] arr) {
		String str = "";
		str += arr[0];
		for (int i = 1; i < arr.length; i++) {
			str += ',';
			str += arr[i];
		}
		return str;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String fName = request.getParameter("fName");
		String mName = request.getParameter("mName");
		String lName = request.getParameter("lName");
		String aName = request.getParameter("aName");
		String phn = request.getParameter("phn");
		String udob = request.getParameter("dob");
		String tcsionId = request.getParameter("TCSion ID");
		String designation = request.getParameter("designation");
		String subject = request.getParameter("subject");
		String highestQualification = request.getParameter("HQ");
		String anyOther = request.getParameter("other");
		String teachingExp = request.getParameter("tExp");
		// String teachingMethods = request.getParameter("TM");
		// String technologyUses= request.getParameter("tUsed");
		String smd = request.getParameter("SMD");
		// String ceqt = request.getParameter("CEQT");

		String[] TM = request.getParameterValues("teachingMethods");
		String teachingMethods = convert(TM);
		String[] TU = request.getParameterValues("technologyUsed");
		String technologyUses = convert(TU);
		String[] C = request.getParameterValues("contribution");
		String ceqt = convert(C);

		HttpSession session = request.getSession(false);
		String uName = (String) session.getAttribute("user");

		System.out.println(fName + ' ' + mName + ' ' + lName + ' ' + aName + ' ' + phn + ' ' + udob + ' ' + tcsionId
				+ ' ' + designation + ' ' + subject + ' ' + highestQualification + ' ' + anyOther + ' ' + teachingExp
				+ ' ' + teachingMethods + ' ' + technologyUses + ' ' + smd + ' ' + ceqt + ' ' + uName);
		MyDetailsData myDetailsData = new MyDetailsData(fName, mName, lName, uName, aName, phn, udob, tcsionId,
				designation, subject, highestQualification, anyOther, teachingExp, teachingMethods, technologyUses, smd,
				ceqt);

		myDetailsDaw mDao = new myDetailsDaw();
		String result = mDao.insert(myDetailsData);
//		response.getWriter().print(result);
//		HttpSession ses = request.getSession();
		if (result == "Data entered successfully") {
			System.out.print("Success");
//		   out.println("<script type=\"text/javascript\">");
//		   out.println("alert('Success');");
////		   out.println("location='myDetails.jsp';");
//		   out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
//			ses.setAttribute("success", result);
//			response.sendRedirect("myDetails.jsp");
		}

	}

}
