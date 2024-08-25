package pkg2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class issueBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		IssueBookManager issueBookManager = new IssueBookManager();
        String action = request.getParameter("action");

        try {
            if ("request".equals(action)) {
                // Request book
                String bookName = request.getParameter("bookName");
                String studentID = request.getParameter("studentID");
                String language = request.getParameter("language");
                boolean success = issueBookManager.requestBook(bookName, studentID, language);
                response.sendRedirect("requestBook.jsp");
            } else if ("accept".equals(action) || "reject".equals(action)) {
                // Accept or reject request
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = issueBookManager.updateRequestStatus(id, action.equals("accept") ? "Accept" : "Reject");
                response.sendRedirect("viewIssuedBook.jsp");
            } else if ("addFine".equals(action)) {
                // Add fine
                int id = Integer.parseInt(request.getParameter("id"));
                double fineAmount = Double.parseDouble(request.getParameter("fineAmount"));
                boolean success = issueBookManager.addFine(id, fineAmount);
                response.sendRedirect("viewIssuedBook.jsp");
            } else if ("returned".equals(action)) {
                // Mark book as returned
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = issueBookManager.markAsReturned(id);
                response.sendRedirect("viewIssuedBook.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
