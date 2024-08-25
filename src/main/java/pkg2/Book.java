package pkg2;

import java.sql.Date;

public class Book {
    private int id;
    private String authorName;
    private String categoryName;
    private Date publicationDate;
    private String isbn;
    private String publisher;
    private String language;
    private String description;
    private String status;

    public Book() {}
    // Constructor
    public Book(int id, String authorName, String categoryName, Date publicationDate, String isbn,
                String publisher, String language, String description, String status) {
        this.id = id;
        this.authorName = authorName;
        this.categoryName = categoryName;
        this.publicationDate = publicationDate;
        this.isbn = isbn;
        this.publisher = publisher;
        this.language = language;
        this.description = description;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    public Date getPublicationDate() { return publicationDate; }
    public void setPublicationDate(Date publicationDate) { this.publicationDate = publicationDate; }
    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }
    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
