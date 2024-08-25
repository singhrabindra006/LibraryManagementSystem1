package pkg2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookManager bookManager = new BookManager();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("book_form.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String author = request.getParameter("author_name");
        String category = request.getParameter("category_name");
        Date publicationDate = Date.valueOf(request.getParameter("publication_date"));
        String isbn = request.getParameter("isbn");
        String publisher = request.getParameter("publisher");
        String language = request.getParameter("language");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        Book newBook = new Book();
        newBook.setAuthorName(author);
        newBook.setCategoryName(category);
        newBook.setPublicationDate(publicationDate);
        newBook.setIsbn(isbn);
        newBook.setPublisher(publisher);
        newBook.setLanguage(language);
        newBook.setDescription(description);
        newBook.setStatus(status);

        try {
            bookManager.addBook(newBook);
            response.sendRedirect("searchBooks.jsp");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

}
