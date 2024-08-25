<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <%@ include file="Component/allcss.jsp" %>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        body {
            display: flex;
            flex-direction: column;
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
            max-width: 800px;
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
        .footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .content-wrapper {
            flex: 1;
            padding: 20px;
            margin-top: 60px; /* Adjust based on header height */
            margin-bottom: 60px; /* Adjust based on footer height */
            overflow-y: auto;
        }
    </style>
</head>
<body>

<%@ include file="Component/header.jsp" %>

<div class="content-wrapper">
    <!-- Page Title -->
    <div class="page-title">
        Student Dashboard
    </div>
    
    <!-- Dashboard Content -->
<div class="dashboard-container">
    <div class="dashboard-item">
        <i class="fas fa-book"></i><br>
        <span class="number"></span><br>
        <span class="label">Available Books</span>
    </div>
    <div class="dashboard-item">
        <i class="fas fa-shopping-cart"></i><br>
        <span class="number"></span><br>
        <span class="label">My Issue Books</span>
    </div>
    <div class="dashboard-item">
        <i class="fas fa-undo"></i><br>
        <span class="number"></span><br>
        <span class="label">Books Returned</span>
    </div>
</div>
    

</div>

<%@ include file="Component/footer.jsp" %>


</body>
</html>
