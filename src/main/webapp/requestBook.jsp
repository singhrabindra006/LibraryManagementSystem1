<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="pkg2.BookIssue" %>
<%@ page import="pkg2.IssueBookManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request a Book</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@include file="Component/allcss.jsp" %>
    
    <style>
    body, html {
        height: 100%;
        margin: 0;
    }

    /* Content wrapper with padding to avoid overlap with header and footer */
    .content-wrapper {
        padding-top: 70px; /* Adjust if header height changes */
        padding-bottom: 50px; /* Adjust if footer height changes */
        height: calc(100% - 120px); /* Adjust total height minus header and footer */
        overflow-y: auto;
    }
</style>
</head>
<body>
    <%@include file="Component/header.jsp" %>

    <div class="content-wrapper">
        <div class="container">
            <!-- Reduced Card Size and Centered using Bootstrap -->
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Request a Book</h3>
                        </div>
                        <div class="card-body">
                            <form action="issueBookServlet" method="get">
                                <input type="hidden" name="action" value="request">
                                <div class="form-group">
                                    <label for="bookName">Category Name:</label>
                                    <input type="text" class="form-control" id="bookName" name="bookName" required>
                                </div>
                                <div class="form-group">
                                    <label for="studentID">Student ID:</label>
                                    <input type="text" class="form-control" id="studentID" name="studentID" required>
                                </div>
                                <div class="form-group">
                                    <label for="language">Language:</label>
                                    <input type="text" class="form-control" id="language" name="language" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Request Book</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <h1 class="mt-5 text-center">Manage Book Requests</h1>

            <!-- Reduced Table Size and Centered using Bootstrap -->
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Student ID</th>
                                <th>Language</th>
                                <th>Issue Date</th>
                                <th>Return Date</th>
                                <th>Request Status</th>
                                <th>Return Status</th>
                                <th>Fine</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                IssueBookManager issueBookManager = new IssueBookManager();
                                List<BookIssue> bookIssues = issueBookManager.getAllIssuedBooks();
                                
                                for (BookIssue issue : bookIssues) {
                            %>
                                <tr>
                                    <td><%= issue.getId() %></td>
                                    <td><%= issue.getBookName() %></td>
                                    <td><%= issue.getStudentID() %></td>
                                    <td><%= issue.getLanguage() %></td>
                                    <td><%= issue.getIssuesDate() %></td>
                                    <td><%= issue.getReturnDate() %></td>
                                    <td><%= issue.getRequestStatus() %></td>
                                    <td><%= issue.getReturnStatus() %></td>
                                    <td><%= issue.getFine() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%@include file="Component/footer.jsp" %>
</body>
</html>
