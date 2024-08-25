<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Book</title>
    <%@ include file="Component/allcss.jsp" %> <!-- Bootstrap CSS -->
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar, .footer {
            flex-shrink: 0;
        }
        .content {
            flex: 1;
            overflow-y: auto;
            padding: 70px 20px 50px 20px; /* Space for fixed header and footer */
        }
        .form-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Include the header -->
<%@ include file="Component/booknavbar.jsp" %>

<!-- Scrollable Content -->
<div class="content">
    <div class="form-container">
        <h1>Edit Book</h1>

        <%
            // Retrieve the book ID from the request parameter
            int id = Integer.parseInt(request.getParameter("id"));

            // Create an instance of BookManager to get the book details
            pkg2.BookManager bookManager = new pkg2.BookManager();
            pkg2.Book book = bookManager.search(id);

            if (book == null) {
                out.println("<div class='alert alert-warning' role='alert'>Book not found!</div>");
                out.println("<a href='searchBooks.jsp' class='btn btn-primary'>Back to Book List</a>");
            } else {
        %>
            <form action="EditBookServlet" method="post">
                <input type="hidden" name="id" value="<%= book.getId() %>">
                <div class="mb-3">
                    <label for="author_name" class="form-label">Author Name:</label>
                    <input type="text" id="author_name" name="author_name" class="form-control" value="<%= book.getAuthorName() %>" required>
                </div>
                <div class="mb-3">
                    <label for="category_name" class="form-label">Category Name:</label>
                    <input type="text" id="category_name" name="category_name" class="form-control" value="<%= book.getCategoryName() %>" required>
                </div>
                <div class="mb-3">
                    <label for="publication_date" class="form-label">Publication Date:</label>
                    <input type="date" id="publication_date" name="publication_date" class="form-control" value="<%= book.getPublicationDate().toLocalDate() %>" required>
                </div>
                <div class="mb-3">
                    <label for="isbn" class="form-label">ISBN:</label>
                    <input type="text" id="isbn" name="isbn" class="form-control" value="<%= book.getIsbn() %>" required>
                </div>
                <div class="mb-3">
                    <label for="publisher" class="form-label">Publisher:</label>
                    <input type="text" id="publisher" name="publisher" class="form-control" value="<%= book.getPublisher() %>" required>
                </div>
                <div class="mb-3">
                    <label for="language" class="form-label">Language:</label>
                    <input type="text" id="language" name="language" class="form-control" value="<%= book.getLanguage() %>" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <textarea id="description" name="description" class="form-control" rows="4" required><%= book.getDescription() %></textarea>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <input type="text" id="status" name="status" class="form-control" value="<%= book.getStatus() %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Book</button>
                <a href="BookHomePage.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        <% 
            }
        %>
    </div>
</div>

<!-- Fixed Footer -->
<div class="footer">
    <%@ include file="Component/footer.jsp" %>
</div>

<script type="text/javascript">
    // Show alert if update was successful
    <% if ("true".equals(request.getAttribute("updateSuccess"))) { %>
        showAlert("Book updated successfully!");
    <% } %>
</script>

</body>
</html>
