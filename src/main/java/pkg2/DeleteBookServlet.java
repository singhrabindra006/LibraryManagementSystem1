package pkg2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private BookManager bookManager = new BookManager();
   
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
	        
	        // Perform the deletion
	        boolean deleted = bookManager.deleteBook(id);

	        // Redirect to the confirmation page
	        response.sendRedirect("DeleteBookForm.jsp?success=" + deleted);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doGet(request, response);
	    }
}
