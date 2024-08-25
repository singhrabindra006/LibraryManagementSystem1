<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="pkg2.Book"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Book</title>
    <%@ include file="Component/allcss.jsp" %>
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
            padding-top: 70px; /* Space for fixed header */
            padding-bottom: 50px; /* Space for fixed footer */
        }
        .card {
            width: 24rem;
        }
    </style>
</head>
<body>

<%@ include file="Component/header.jsp" %>

<!-- Search Form -->
<div class="content d-flex align-items-center justify-content-center">
    <div class="card text-center">
        <div class="card-body">
            <h3 class="card-title mb-4">Search Book</h3>
            <form action='searchServlet_student'>
                <div class="form-group mb-3">
                    <input type="text" name="txtSearch" class="form-control" placeholder="Search Books">
                </div>
                <button type="submit" class="btn btn-primary">SEARCH</button>
                <a href="BookHomePage.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<!-- Books List -->
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
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieve the list of books from the request attribute
                    List<Book> books = (List<Book>) request.getAttribute("books");
                    
                    if (books != null && !books.isEmpty()) {
                        for (Book book : books) {
                            out.println("<tr>" +
                                "<td>" + book.getId() + "</td>" +
                                "<td>" + book.getAuthorName() + "</td>" +
                                "<td>" + book.getCategoryName() + "</td>" +
                                "<td>" + book.getPublicationDate() + "</td>" +
                                "<td>" + book.getIsbn() + "</td>" +
                                "<td>" + book.getPublisher() + "</td>" +
                                "<td>" + book.getLanguage() + "</td>" +
                                "<td>" + book.getDescription() + "</td>" +
                                "<td>" + book.getStatus() + "</td>" +
                                "</tr>");
                        }
                    } else {
                        out.println("<tr><td colspan='9'>No books available.</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Fixed Footer -->
<div class="footer" style="position: fixed; bottom: 0; width: 100%;">
    <%@ include file="Component/footer.jsp" %>
</div>

</body>
</html>
