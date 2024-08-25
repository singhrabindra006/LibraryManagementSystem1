package pkg2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int bookId = Integer.parseInt(idParam);
                IssueBookManager issueBookManager = new IssueBookManager();
                BookIssue issue = issueBookManager.getBookIssueById(bookId);

                if (issue != null) {
                    issueBookManager.returnBook(bookId);
                    response.sendRedirect("returnBookByStudent.jsp"); // Redirect to a success page
                } else {
                    response.sendRedirect("returnBookError.jsp?message=Invalid Book ID"); // Redirect to an error page
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("returnBookError.jsp?message=Invalid Book ID format"); // Redirect to an error page
            }
        } else {
            response.sendRedirect("returnBookError.jsp?message=Book ID is required"); // Redirect to an error page
        }
    }
    
    
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
