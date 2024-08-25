<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-nav .nav-link {
            color: #ffffff !important;
            font-weight: bold;
            margin-right: 15px;
        }
        .navbar-brand {
            color: #ffffff !important;
            font-weight: bold;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-header {
            background-color: #d1ecf1;
            padding: 10px;
            border-radius: 8px 8px 0 0;
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #0c5460;
        }
        .page-title {
            text-align: center;
            margin-top: 20px;
            font-size: 28px;
            color: #343a40;
        }
        .footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<!-- Header with Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Library Management System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="admin_login.jsp">Admin Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="student_login.jsp">Student Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="student_signup.jsp">Student Signup</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin_signup.jsp">Admin Signup</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Title -->
<div class="page-title">
    STUDENT LOGIN FORM
</div>

<!-- Login Form -->
<div class="login-container">
    <div class="form-header">LOGIN FORM</div>
    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label for="email">Enter Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Login</button>
        
        <!-- Forgot Password Link -->
    <div class="form-group">
        <a href="forgotPasswordStudent.jsp">Forgot Password?</a>
    </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2024 Library Management System. All rights reserved.
</div>

