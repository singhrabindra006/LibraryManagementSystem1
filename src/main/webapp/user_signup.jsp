<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Signup</title>
    <%@include file="Component/allcss.jsp" %>
    <style>
        /* Custom styles for fixed header and footer */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa; /* Light background color for the page */
        }
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1000;
        }
        .main-content {
            flex: 1;
            margin-top: 60px; /* Adjust based on header height */
            margin-bottom: 60px; /* Adjust based on footer height */
            padding: 20px;
        }
        .card {
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            border-bottom: 1px solid #007bff;
        }
        .card-body {
            padding: 2rem;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
    </style>
</head>
<body>
    <%@include file="Component/navbar.jsp" %>

    <!-- Main Content -->
    <div class="main-content container mt-5">
        <!-- Signup Form -->
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>User Signup Form</h4>
                    </div>
                    <div class="card-body">
                        <form action="RegisterStudentServlet" method="post">
                            <div class="form-group">
                                <label for="fullName">Enter Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter Full Name" required>
                            </div>
                            <div class="form-group">
                                <label for="studentID">Student ID</label>
                                <input type="text" class="form-control" id="studentID" name="studentID" placeholder="Enter Student ID" required>
                            </div>
                            <div class="form-group">
                                <label for="address">Enter Address</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" required>
                            </div>
                            <div class="form-group">
                                <label for="mobileNumber">Mobile Number</label>
                                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter Mobile Number" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Enter Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Enter Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                            </div>
                            <div class="d-flex justify-content-center mt-4">
                                <button type="submit" class="btn btn-danger">Register Now</button>
                            </div>
                        </form>
                        <!-- Back to Login Link -->
                        <div class="text-center mt-3">
                            <a href="user_login.jsp" >Back to Login ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="Component/footer.jsp" %>
</body>
</html>
