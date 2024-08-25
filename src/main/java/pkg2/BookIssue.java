package pkg2;

import java.sql.Timestamp;

public class BookIssue {
    private int id;
    private String bookName;
    private String studentID;
    private String language;
    private Timestamp issuesDate;
    private Timestamp returnDate;
    private String requestStatus;
    private String returnStatus;
    private double fine;
    
    public BookIssue() {};

    public BookIssue(int id, String bookName, String studentID, String language, Timestamp issuesDate,
                     Timestamp returnDate, String requestStatus, String returnStatus, double fine) {
        this.id = id;
        this.bookName = bookName;
        this.studentID = studentID;
        this.language = language;
        this.issuesDate = issuesDate;
        this.returnDate = returnDate;
        this.requestStatus = requestStatus;
        this.returnStatus = returnStatus;
        this.fine = fine;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Timestamp getIssuesDate() {
		return issuesDate;
	}

	public void setIssuesDate(Timestamp issuesDate) {
		this.issuesDate = issuesDate;
	}

	public Timestamp getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	public double getFine() {
		return fine;
	}

	public void setFine(double fine) {
		this.fine = fine;
	}

    // Getters and setters for each field
}
