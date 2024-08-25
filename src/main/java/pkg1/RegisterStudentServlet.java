package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class RegisterStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Receive parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String studentID = request.getParameter("studentID");
        String address = request.getParameter("address");
        String mobileNumber = request.getParameter("mobileNumber");
        String password = request.getParameter("password");

        // Ensure passwords match (add validation)
        String confirmPassword = request.getParameter("confirmPassword");
        if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            response.getWriter().println("Passwords do not match. Please try again.");
            return;
        }

        LoginManager loginManager = new LoginManager();

        try {
            boolean isSuccess = loginManager.saveStudent(fullName, email, studentID, address, password, mobileNumber, studentID);
            if (isSuccess) {
                response.sendRedirect("user_login.jsp");  // Redirect after successful registration
            } else {
                response.getWriter().println("Registration failed. Please try again.");
                request.getRequestDispatcher("user_signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
