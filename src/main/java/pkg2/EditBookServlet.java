package pkg2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;


public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve parameters from the form
        int id = Integer.parseInt(request.getParameter("id"));
        String authorName = request.getParameter("author_name");
        String categoryName = request.getParameter("category_name");
        Date publicationDate = Date.valueOf(request.getParameter("publication_date"));
        String isbn = request.getParameter("isbn");
        String publisher = request.getParameter("publisher");
        String language = request.getParameter("language");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        // Create a BookManager instance and update the book
        BookManager bookManager = new BookManager();
        boolean updated = bookManager.updateBook(id, authorName, categoryName, publicationDate, isbn, publisher, language, description, status);

        // Set update success attribute
        request.setAttribute("updateSuccess", updated ? "true" : "false");

        // Redirect to DisplayBooks.jsp with a success message
        response.sendRedirect("searchBooks.jsp");
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}


  
