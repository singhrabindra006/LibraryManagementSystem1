<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="pkg2.BookIssue" %>
<%@ page import="pkg2.IssueBookManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Issued Books</title>
    <%@ include file="Component/allcss.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar-fixed-top {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1030;
        }
        .footer-fixed {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1030;
        }
        .content {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            margin-top: 56px; /* Adjust based on navbar height */
            margin-bottom: 56px; /* Adjust based on footer height */
        }
    </style>
</head>
<body>
    <%@ include file="Component/dashboardnavbar.jsp" %>
   
   <figure class="text-center">
  <blockquote class="blockquote">
    <h1>List Of Issued Book</h1>
  </blockquote>
</figure>
   
    <div class="content">
        <!-- Displaying all book requests -->
        <table class="table table-bordered table-striped">
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
                    <th>Action</th>
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
                        <td>
                            <% if ("Request".equals(issue.getRequestStatus())) { %>
                                <form action="issueBookServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="accept">
                                    <input type="hidden" name="id" value="<%= issue.getId() %>">
                                    <button type="submit" class="btn btn-success btn-sm">Accept</button>
                                </form>
                                <form action="issueBookServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="reject">
                                    <input type="hidden" name="id" value="<%= issue.getId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                </form>
                            <% } %>
                            <% if ("Accepted".equals(issue.getRequestStatus()) && "NotReturned".equals(issue.getReturnStatus())) { %>
                                <form action="issueBookServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="addFine">
                                    <input type="hidden" name="id" value="<%= issue.getId() %>">
                                    <label for="fineAmount" class="sr-only">Fine Amount:</label>
                                    <input type="number" id="fineAmount" name="fineAmount" step="0.01" required class="form-control form-control-sm d-inline" style="width:auto;">
                                    <button type="submit" class="btn btn-warning btn-sm">Add Fine</button>
                                </form>
                            <% } %>
                            <% if ("Accepted".equals(issue.getRequestStatus()) && "NotReturned".equals(issue.getReturnStatus())) { %>
                                <form action="issueBookServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="returned">
                                    <input type="hidden" name="id" value="<%= issue.getId() %>">
                                    <button type="submit" class="btn btn-primary btn-sm">Mark as Returned</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="Component/footer.jsp" %>
</body>
</html>
