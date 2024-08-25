<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pkg2.BookIssue" %>
<%@ page import="java.util.List" %>
<%@ page import="pkg2.IssueBookManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Return Book by Student</title>
    <%@include file="Component/allcss.jsp" %>
    
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        /* Fixed header and footer */
        .fixed-top, .fixed-bottom {
            width: 100%;
            z-index: 1030;
        }

        /* Content wrapper with padding to avoid overlap with header and footer */
        .content-wrapper {
            padding-top: 70px; /* Adjust if header height changes */
            padding-bottom: 50px; /* Adjust if footer height changes */
            height: calc(100% - 120px); /* Adjust total height minus header and footer */
            overflow-y: auto;
        }

        .card {
            margin-top: 20px;
            max-width: 400px; /* Adjust the max width to make the card smaller */
            margin-left: auto;
            margin-right: auto; /* Center the card horizontally */
        }
    </style>
</head>
<body>
    <%@include file="Component/dashboardnavbar.jsp" %>

    <div class="content-wrapper">
        <div class="container">
            
            <!-- Search form inside a smaller Bootstrap card -->
            <div class="card">
                <div class="card-header">
                    <h3>Search Books by Student ID</h3>
                </div>
                <div class="card-body">
                    <form action="returnBookByStudent.jsp" method="get" class="form-inline">
                        <label for="studentID" class="mr-2">Student ID:</label>
                        <input type="text" id="studentID" name="studentID" class="form-control mr-2" required>
                        <br>
                       <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary">Search Books</button>
                      </div>
                       
                    </form>
                </div>
            </div>

            <%
                String studentID = request.getParameter("studentID");
                IssueBookManager issueBookManager = new IssueBookManager();

                if (studentID != null && !studentID.isEmpty()) {
                    List<BookIssue> studentBooks = issueBookManager.getBooksByStudent(studentID);

                    if (studentBooks != null && !studentBooks.isEmpty()) {
            %>
                        <!-- Displaying all book requests -->
                        <h2 class="mt-4">Books Issued to Student ID: <%= studentID %></h2>
                        <table class="table table-striped table-bordered table-hover mt-3">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Category Name</th>
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
                                    for (BookIssue issue : studentBooks) {
                                %>
                                    <tr>
                                        <td><%= issue.getId() %></td>
                                        <td><%= issue.getBookName() %></td>
                                        <td><%= issue.getLanguage() %></td>
                                        <td><%= issue.getIssuesDate() %></td>
                                        <td><%= issue.getReturnDate() %></td>
                                        <td><%= issue.getRequestStatus() %></td>
                                        <td><%= issue.getReturnStatus() %></td>
                                        <td><%= issue.getFine() %></td>
                                        <td>
                                            <!-- Form to return the book -->
                                            <form action="ReturnBookServlet" method="post">
                                                <input type="hidden" name="id" value="<%= issue.getId() %>">
                                                <button type="submit" class="btn btn-danger btn-sm">Return Book</button>
                                            </form>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
            <% 
                    } else {
            %>
                        <div class="alert alert-warning mt-4" role="alert">
                            No books found for Student ID: <%= studentID %>
                        </div>
            <% 
                    }
                }
            %>
        </div>
    </div>

    <%@include file="Component/footer.jsp" %>
</body>
</html>
