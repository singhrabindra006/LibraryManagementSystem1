<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pkg2.BookIssue" %>
<%@ page import="pkg2.IssueBookManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Return Book</title>
</head>
<body>
    <h1>Return Book</h1>
    <%
        IssueBookManager issueBookManager = new IssueBookManager();
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int bookId = Integer.parseInt(idParam); // Convert ID to integer
                BookIssue issue = issueBookManager.getBookIssueById(bookId);

                if (issue != null) {
    %>
                    <!-- Form to return the book -->
                    <form action="returnBook" method="post">
                        <input type="hidden" name="id" value="<%= issue.getId() %>">
                        <button type="submit">Return Book</button>
                    </form>
    <% 
                } else { 
    %>
                    <p>Invalid Book ID. The book issue record does not exist.</p>
    <% 
                } 
            } catch (NumberFormatException e) { 
    %>
                <p>Invalid Book ID format.</p>
    <% 
            }
        } else { 
    %>
            <p>Book ID is required.</p>
    <% 
        } 
    %>
</body>
</html>
