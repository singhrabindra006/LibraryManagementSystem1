package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
       

        // Validate passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("staff_signup.jsp").forward(request, response);
            return;
        }

        // Create an instance of LoginManager
        LoginManager loginManager = new LoginManager();

        // Save the new admin user
        boolean success = loginManager.saveStaff(fullName, email, address, loginName, password, phone);

        if (success) {
            // Redirect to a success page or the login page
            response.sendRedirect("staff_login.jsp");
        } else {
            // Handle error
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("staff_signup.jsp").forward(request, response);
        }
    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
