package pkg2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pkg1.MyDB;

public class IssueBookManager {

    // Method to request a book
    public boolean requestBook(String bookName, String studentID, String language) {
        boolean result = false;
        String SQL = "INSERT INTO tblissuedbookdetails (BookName, StudentID, language, RequestStatus, ReturnStatus) VALUES (?, ?, ?, 'Request', 'NotReturned')";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setString(1, bookName);
            pstat.setString(2, studentID);
            pstat.setString(3, language);

            int rowsAffected = pstat.executeUpdate();
            result = rowsAffected > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return result;
    }

    // Method for staff to accept/reject book requests
    public boolean updateRequestStatus(int id, String status) {
        boolean result = false;
        String SQL = "UPDATE tblissuedbookdetails SET RequestStatus=? WHERE id=?";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setString(1, status);
            pstat.setInt(2, id);

            int rowsAffected = pstat.executeUpdate();
            result = rowsAffected > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return result;
    }

    // Method to update the fine if the book is not returned on time
    public boolean addFine(int id, double fineAmount) {
        boolean result = false;
        String SQL = "UPDATE tblissuedbookdetails SET Fine=? WHERE id=? AND ReturnStatus='NotReturned'";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setDouble(1, fineAmount);
            pstat.setInt(2, id);

            int rowsAffected = pstat.executeUpdate();
            result = rowsAffected > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return result;
    }

    // Method to fetch all issued book details
    public List<BookIssue> getAllIssuedBooks() {
        List<BookIssue> bookIssues = new ArrayList<>();
        String SQL = "SELECT * FROM tblissuedbookdetails";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL);
             ResultSet rs = pstat.executeQuery()) {

            while (rs.next()) {
                BookIssue issue = new BookIssue(
                        rs.getInt("id"),
                        rs.getString("BookName"),
                        rs.getString("StudentID"),
                        rs.getString("language"),
                        rs.getTimestamp("IssuesDate"),
                        rs.getTimestamp("ReturnDate"),
                        rs.getString("RequestStatus"),
                        rs.getString("ReturnStatus"),
                        rs.getDouble("Fine")
                );
                bookIssues.add(issue);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return bookIssues;
    }
    
    // Method to get books issued to a particular student
    public List<BookIssue> getBooksByStudent(String studentID) {
        List<BookIssue> studentBooks = new ArrayList<>();
        String SQL = "SELECT * FROM tblissuedbookdetails WHERE StudentID=?";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setString(1, studentID);
            try (ResultSet rs = pstat.executeQuery()) {
                while (rs.next()) {
                    BookIssue issue = new BookIssue(
                            rs.getInt("id"),
                            rs.getString("BookName"),
                            rs.getString("StudentID"),
                            rs.getString("language"),
                            rs.getTimestamp("IssuesDate"),
                            rs.getTimestamp("ReturnDate"),
                            rs.getString("RequestStatus"),
                            rs.getString("ReturnStatus"),
                            rs.getDouble("Fine")
                    );
                    studentBooks.add(issue);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return studentBooks;
    }
    
    // Method to mark a book as returned
    public boolean markAsReturned(int id) {
        boolean result = false;
        String SQL = "UPDATE tblissuedbookdetails SET ReturnDate=NOW(), ReturnStatus='Returned' WHERE id=? AND ReturnStatus='NotReturned'";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setInt(1, id);

            int rowsAffected = pstat.executeUpdate();
            result = rowsAffected > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return result;
    }
    
    // Method to get a specific book issue by its ID
    public BookIssue getBookIssueById(int id) {
        BookIssue issue = null;
        String SQL = "SELECT * FROM tblissuedbookdetails WHERE id=?";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            pstat.setInt(1, id);
            ResultSet rs = pstat.executeQuery();

            if (rs.next()) {
                issue = new BookIssue(
                        rs.getInt("id"),
                        rs.getString("BookName"),
                        rs.getString("StudentID"),
                        rs.getString("language"),
                        rs.getTimestamp("IssuesDate"),
                        rs.getTimestamp("ReturnDate"),
                        rs.getString("RequestStatus"),
                        rs.getString("ReturnStatus"),
                        rs.getDouble("Fine")
                );
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return issue;
    }

    // Method to return a book
    public boolean returnBook(int bookId) {
        return markAsReturned(bookId);
    }
}
