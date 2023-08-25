package com.marvel.publishedbooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marvel.program.ProgramData;
import com.marvel.program.ProgramDaw;

/**
 * Servlet implementation class PublishedBooksEditServlet
 */
@WebServlet("/PublishedBooksEditServlet")
public class PublishedBooksEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishedBooksEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN_ISSN = request.getParameter("ISBN_ISSN");
		String bookTitle = request.getParameter("bookTitle");
		String paperTitle = request.getParameter("paperTitle");
		String titlePC = request.getParameter("titlePC");
		String year = request.getParameter("year");
		String WTPAIS = request.getParameter("WTPAIS");
		String publisherName = request.getParameter("publisherName");
		String teacherName = request.getParameter("teacherName");
		
		
		String ISBN_ISSNprev = request.getParameter("ISBN_ISSNprev");
		String bookTitlePrev = request.getParameter("bookTitlePrev");
		String paperTitlePrev = request.getParameter("paperTitlePrev");
		String titlePCprev = request.getParameter("titlePCprev");
		String yearPrev = request.getParameter("yearPrev");
		String WTPAISprev = request.getParameter("WTPAISprev");
		String publisherNamePrev = request.getParameter("publisherNamePrev");
		String teacherNamePrev = request.getParameter("teacherNamePrev");
		
		//System.out.println(conductingYear +' '+programName+' '+participantsNumber+' '+startDate+' '+endDate+' '+link);
		//System.out.println(conductingYearPrev +' '+programNamePrev+' '+participantsNumberPrev+' '+startDatePrev+' '+endDatePrev+' '+linkPrev);
		PublishedBooksData booksData=new PublishedBooksData(ISBN_ISSN,bookTitle,paperTitle,titlePC,year,WTPAIS,publisherName,teacherName);
		PublishedBooksData booksDataPrev=new PublishedBooksData(ISBN_ISSNprev,bookTitlePrev,paperTitlePrev,titlePCprev,yearPrev,WTPAISprev,publisherNamePrev,teacherNamePrev);
		PublishedBooksDaw booksDaw=new PublishedBooksDaw();
		String result=booksDaw.update(booksData,booksDataPrev);
		String message="";
		if(result=="Data updated successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("PublishBook.jsp").forward(request, response);
		}
		else if(result==""){
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("PublishBook.jsp").forward(request, response);
		}
	}

}
