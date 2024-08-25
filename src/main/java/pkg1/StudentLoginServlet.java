package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class StudentLoginServlet
 */
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve email and password from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create an instance of LoginManager
        LoginManager loginManager = new LoginManager();
        boolean isValidUser = loginManager.validateLogin(email, password, "student");

        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("userType", "student");

            System.out.println("Redirecting to the student dashboard.");
            response.sendRedirect("studentdashboard.jsp");
        } else {
            // Failed login, redirect back to the student login page with an error message
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("user_login.jsp").forward(request, response);
        }
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
