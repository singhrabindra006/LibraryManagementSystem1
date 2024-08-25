<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Form</title>
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
        .card {
            margin: auto;
            width: 36rem;
        }
    </style>
</head>
<body>

 <%@include file="Component/booknavbar.jsp" %>

<!-- Scrollable Content -->
<div class="content">
    <div class="card">
        <div class="card-body ">
            <h2 class="card-title mb-3 text-center">Book Form</h2>
            <form action="AddBookServlet" method="post">
                <input type="hidden" name="action" value="${book != null ? 'update' : 'insert'}">
                <c:if test="${book != null}">
                    <input type="hidden" name="id" value="${book.id}">
                </c:if>
                <div class="form-group">
                    <label>Author Name</label>
                    <input type="text" name="author_name" class="form-control" value="${book != null ? book.authorName : ''}" required>
                </div>
                <div class="form-group">
                    <label>Category Name</label>
                    <input type="text" name="category_name" class="form-control" value="${book != null ? book.categoryName : ''}" required>
                </div>
                <div class="form-group">
                    <label>Publication Date</label>
                    <input type="date" name="publication_date" class="form-control" value="${book != null ? book.publicationDate.toLocalDate() : ''}" required>
                </div>
                <div class="form-group">
                    <label>ISBN</label>
                    <input type="text" name="isbn" class="form-control" value="${book != null ? book.isbn : ''}" required>
                </div>
                <div class="form-group">
                    <label>Publisher</label>
                    <input type="text" name="publisher" class="form-control" value="${book != null ? book.publisher : ''}" required>
                </div>
                <div class="form-group">
                    <label>Language</label>
                    <input type="text" name="language" class="form-control" value="${book != null ? book.language : ''}" required>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" required>${book != null ? book.description : ''}</textarea>
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <select name="status" class="form-control" required>
                        <option value="available" ${book != null && book.status == 'available' ? 'selected' : ''}>Available</option>
                        <option value="issued" ${book != null && book.status == 'issued' ? 'selected' : ''}>Issued</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="BookHomePage.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<!-- Fixed Footer -->
<div class="footer" style="position: fixed; bottom: 0; width: 100%;">
    <%@include file="Component/footer.jsp" %>
</div>

</body>
</html>
