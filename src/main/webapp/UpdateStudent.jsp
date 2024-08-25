<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <%@include file="Component/allcss.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }
        .card {
            width: 30rem;
            max-width: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<%@include file="Component/header.jsp" %>

<!-- Scrollable Content -->
<div class="content">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center">Update Student</h2>
            <form action="UpdateStudentServlet" method="post">
                <!-- Hidden field for student ID -->
                <input type="hidden" name="user_id" value="${student.userId}">

                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="full_name" class="form-control" value="${student.fullName}" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" value="${student.email}" required>
                </div>
                <div class="form-group">
                    <label>Login Name</label>
                    <input type="text" name="login_name" class="form-control" value="${student.loginName}" required>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="address" class="form-control" value="${student.address}" required>
                </div>
                <div class="form-group">
                    <label>New Password (leave blank if not changing)</label>
                    <input type="password" name="login_password" class="form-control">
                </div>
                <div class="form-group">
                    <label>Mobile Number</label>
                    <input type="text" name="mobile_number" class="form-control" value="${student.mobileNumber}" required>
                </div>
                <div class="form-group">
                    <label>Student ID</label>
                    <input type="text" name="student_id" class="form-control" value="${student.studentID}" required>
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
                <a href="StudentHomePage.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<%@include file="Component/footer.jsp" %>

</body>
</html>
