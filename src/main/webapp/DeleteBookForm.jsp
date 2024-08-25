<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Confirmation</title>
    <%@include file="Component/allcss.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: #fff;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1000;
            background: #fff;
        }
        .main {
            display: flex;
            flex-direction: column;
            flex: 1;
            margin-top: 60px;
            margin-bottom: 50px;
            padding: 20px;
            box-sizing: border-box;
            overflow-y: auto;
            text-align: center;
        }
        .alert {
            margin: auto;
            max-width: 600px;
            padding: 20px;
            border-radius: 8px;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>
<body>

<!-- Fixed Header -->
<div class="header">
    <%@include file="Component/booknavbar.jsp" %>
</div>

<!-- Main Content Area -->
<div class="main">
    <%
        boolean success = "true".equals(request.getParameter("success"));
    %>
    <div class="alert <%= success ? "success" : "" %>">
        <h1><%= success ? "Success!" : "Error" %></h1>
        <p><%= success ? "The book has been deleted successfully." : "Failed to delete the book." %></p>
        <a href="searchBooks.jsp" class="btn btn-primary">Back to Book List</a>
    </div>
</div>

<!-- Fixed Footer -->
<div class="footer">
    <%@include file="Component/footer.jsp" %>
</div>

</body>
</html>
