<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fine</title>
    <%@include file="Component/allcss.jsp" %> <!-- Bootstrap CSS is included here -->
    <style>
        .alert-custom {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 300px;
            z-index: 1050; /* Ensure it is on top of other content */
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <%@ include file="Component/dashboardnavbar.jsp" %>

    <!-- Main Content Area -->
    <div class="container flex-grow-1 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg" style="width: 100%; max-width: 400px;"> <!-- Smaller card size -->
            <div class="card-body">
                <h1 class="card-title text-center mb-4">Add Fine for Overdue Books</h1>

                <!-- Alert message for successful fine addition -->
                <% 
                    String fineAdded = request.getParameter("success");
                    if ("true".equals(fineAdded)) {
                %>
                    <div class="alert alert-success alert-dismissible fade show alert-custom" role="alert">
                        Fine added successfully!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } else if ("false".equals(fineAdded)) { %>
                    <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                        Failed to add fine. Please try again.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <form action="addFineServlet" method="post">
                    <div class="mb-3">
                        <label for="issueId" class="form-label">Issue ID:</label>
                        <input type="text" id="issueId" name="id" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="fineAmount" class="form-label">Fine Amount:</label>
                        <input type="text" id="fineAmount" name="fine" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-danger w-100">Add Fine</button>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="Component/footer.jsp" %>

</body>
</html>
