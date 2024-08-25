package pkg2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookManager {

    private static final String ADD_BOOK_SQL = "INSERT INTO tblbooks (author_name, category_name, publication_date, isbn, publisher, language, description, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    private void logConnectionSuccess(Connection conn) {
        if (conn != null) {
            System.out.println("Database connection established successfully.");
        } else {
            System.out.println("Failed to establish database connection.");
        }
    }

    public void addBook(Book book) throws SQLException {
        try (Connection conn = MyDB.getConnection()) {
            logConnectionSuccess(conn);
            try (PreparedStatement stmt = conn.prepareStatement(ADD_BOOK_SQL)) {
                stmt.setString(1, book.getAuthorName());
                stmt.setString(2, book.getCategoryName());
                stmt.setDate(3, new java.sql.Date(book.getPublicationDate().getTime()));
                stmt.setString(4, book.getIsbn());
                stmt.setString(5, book.getPublisher());
                stmt.setString(6, book.getLanguage());
                stmt.setString(7, book.getDescription());
                stmt.setString(8, book.getStatus());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error during addBook: " + e.getMessage());
            throw e;
        }
    }

    public Book search(int id) {
        String SQL = "SELECT * FROM tblbooks WHERE id = ?";
        Book book = null;
        try (Connection conn = MyDB.getConnection();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {
            pstat.setInt(1, id);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    book = new Book(rs.getInt("id"), rs.getString("author_name"), rs.getString("category_name"),
                            rs.getDate("publication_date"), rs.getString("isbn"), rs.getString("publisher"),
                            rs.getString("language"), rs.getString("description"), rs.getString("status"));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return book;
    }

    public List<Book> search(String searchTerm) {
        String SQL = "SELECT * FROM tblbooks WHERE author_name LIKE ? OR category_name LIKE ? OR isbn LIKE ? OR publisher LIKE ? OR language LIKE ? OR description LIKE ? OR status LIKE ?";
        List<Book> books = new ArrayList<>();
        try (Connection conn = MyDB.getConnection();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {
            String likeTerm = "%" + searchTerm + "%";
            pstat.setString(1, likeTerm);
            pstat.setString(2, likeTerm);
            pstat.setString(3, likeTerm);
            pstat.setString(4, likeTerm);
            pstat.setString(5, likeTerm);
            pstat.setString(6, likeTerm);
            pstat.setString(7, likeTerm);
            try (ResultSet rs = pstat.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book(rs.getInt("id"), rs.getString("author_name"), rs.getString("category_name"),
                            rs.getDate("publication_date"), rs.getString("isbn"), rs.getString("publisher"),
                            rs.getString("language"), rs.getString("description"), rs.getString("status"));
                    books.add(book);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return books;
    }

    public boolean updateBook(int id, String authorName, String categoryName, Date publicationDate, String isbn,
                              String publisher, String language, String description, String status) {
        boolean result = false;
        String SQL = "UPDATE tblbooks SET author_name = ?, category_name = ?, publication_date = ?, isbn = ?, publisher = ?, language = ?, description = ?, status = ? WHERE id = ?";
        try (Connection conn = MyDB.getConnection();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {
            pstat.setString(1, authorName);
            pstat.setString(2, categoryName);
            pstat.setDate(3, new java.sql.Date(publicationDate.getTime()));
            pstat.setString(4, isbn);
            pstat.setString(5, publisher);
            pstat.setString(6, language);
            pstat.setString(7, description);
            pstat.setString(8, status);
            pstat.setInt(9, id);
            pstat.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return result;
    }

    public boolean deleteBook(int id) {
        boolean result = false;
        String SQL = "DELETE FROM tblbooks WHERE id = ?";
        try (Connection conn = MyDB.getConnection();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {
            pstat.setInt(1, id);
            pstat.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return result;
    }

    public boolean updateBook(Book book) {
        return updateBook(book.getId(), book.getAuthorName(), book.getCategoryName(), book.getPublicationDate(),
                          book.getIsbn(), book.getPublisher(), book.getLanguage(), book.getDescription(), book.getStatus());
    }
	
}
