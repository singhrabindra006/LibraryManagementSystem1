<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="pkg2.Book"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display Books</title>
   <!-- Fixed Footer -->

    <%@include file="Component/allcss.jsp" %>

    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
            overflow-y: auto;
            padding: 70px 0 50px 0; /* Space for fixed header and footer */
        }
        .header, .footer {
            position: fixed;
            width: 100%;
            z-index: 1000;
        }
        .header {
            top: 0;
            background-color: brown;
            color: white;
            padding: 10px 0;
        }
        .footer {
            bottom: 0;
            background-color: brown;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
    </style>
</head>
<body>

<%@include file="Component/booknavbar.jsp" %>

<!-- Scrollable Content -->
<div class="content">
    <div class="container">
        <h1>Books List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Author Name</th>
                    <th>Category Name</th>
                    <th>Publication Date</th>
                    <th>ISBN</th>
                    <th>Publisher</th>
                    <th>Language</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Control</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieve the list of books from the request attribute
                    List<Book> books = (List<Book>) request.getAttribute("books");
                    
                    if (books != null) {
                        for (Book book : books) {
                            out.println("<tr><td>" + book.getId() + "</td><td>" + book.getAuthorName() + "</td><td>" + book.getCategoryName() + "</td><td>" + book.getPublicationDate() + "</td><td>" + book.getIsbn() + "</td><td>" + book.getPublisher() + "</td><td>" + book.getLanguage() + "</td><td>" + book.getDescription() + "</td><td>" + book.getStatus() + "</td><td><a href='EditBookForm.jsp?id=" + book.getId() + "'>EDIT</a> | <a href='DeleteBookServlet?id=" + book.getId() + "'>DELETE</a></td></tr>");
                        }
                    } else {
                        out.println("<tr><td colspan='10'>No books available.</td></tr>");
                    }
                %>
            </tbody>
        </table>
</div>

<!-- Fixed Footer -->
<div class="footer" style="position: fixed; bottom: 0; width: 100%;">
    <%@include file="Component/footer.jsp" %>
</div>

</body>
</html>
