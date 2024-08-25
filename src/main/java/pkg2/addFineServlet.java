package pkg2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class addFineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        double fineAmount = Double.parseDouble(request.getParameter("fine"));

        IssueBookManager manager = new IssueBookManager();
        boolean success = manager.addFine(id, fineAmount);

        if (success) {
            response.getWriter().println("Fine added successfully.");
        } else {
            response.getWriter().println("Failed to add fine.");
        }
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
