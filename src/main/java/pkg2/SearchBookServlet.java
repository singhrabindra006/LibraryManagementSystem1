package pkg2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pkg1.LoginManager;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("txtSearch");
        List<Book> books = new BookManager().search(searchTerm);
        request.setAttribute("books", books);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("DisplayBooks.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
