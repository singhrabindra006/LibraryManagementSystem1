package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve parameters from the request
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String loginName = request.getParameter("login_name");
        String address = request.getParameter("address");
        String loginPassword = request.getParameter("login_password");
        String mobileNumber = request.getParameter("mobile_number");
        String studentID = request.getParameter("student_id");

        // Create an instance of LoginManager
        LoginManager loginManager = new LoginManager();
        
        // Update student details
        boolean isUpdated = loginManager.updateStudent(userId, fullName, email, loginName, address, loginPassword, mobileNumber, studentID);

        // Redirect based on the update result
        if (isUpdated) {
            response.sendRedirect("UpdateSuccess.jsp"); // Redirect to a success page
        } else {
            response.sendRedirect("UpdateError.jsp"); // Redirect to an error page
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
