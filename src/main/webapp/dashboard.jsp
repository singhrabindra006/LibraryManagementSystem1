<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Dashboard Page</title>
    <%@include file="Component/allcss.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
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
        .content {
            flex: 1;
            padding-top: 60px; /* Adjust to the height of the header */
            padding-bottom: 60px; /* Adjust to the height of the footer */
            overflow-y: auto;
        }
        .page-title {
            padding: 10px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #343a40;
        }
        .dashboard-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .dashboard-item {
            display: inline-block;
            width: 150px;
            margin: 15px;
            padding: 20px;
            background-color: #f1f1f1;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-weight: bold;
        }
        .dashboard-item i {
            font-size: 48px;
            margin-bottom: 10px;
            color: #343a40;
        }
        .dashboard-item .number {
            font-size: 28px;
            color: #007bff;
        }
        .dashboard-item .label {
            font-size: 16px;
            color: #343a40;
        }
    </style>
</head>
<body>

<%@include file="Component/dashboardnavbar.jsp" %>

<!-- Middle Content Area -->
<div class="content">
    <!-- Page Title -->
    <div class="page-title">
        Main Dashboard
    </div>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <div class="dashboard-item">
            <i class="fas fa-book"></i><br>
            <span class="number"></span><br>
            <span class="label">Books</span>
        </div>
        <div class="dashboard-item">
            <i class="fas fa-cart-arrow-down"></i><br>
            <span class="number"></span><br>
            <span class="label">Books Issued</span>
        </div>
        <div class="dashboard-item">
            <i class="fas fa-undo"></i><br>
            <span class="number"></span><br>
            <span class="label">Books Returned</span>
        </div>
        <div class="dashboard-item">
            <i class="fas fa-users"></i><br>
            <span class="number"></span><br>
            <span class="label">Registered Students</span>
        </div>
    </div>
</div>

<%@include file="Component/footer.jsp" %>

</body>
</html>
