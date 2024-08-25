<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<%@include file="Component/allcss.jsp" %>
<style>
    body, html {
        height: 100%;
        margin: 0;
    }

    .navbar, .footer {
        position: fixed;
        width: 100%;
        z-index: 10;
    }

    .navbar {
        top: 0;
    }

    .footer {
        bottom: 0;
    }

    .main-content {
        padding-top: 60px; /* Height of the navbar */
        padding-bottom: 60px; /* Height of the footer */
        overflow-y: auto;
        height: calc(100% - 120px); /* Total height minus navbar and footer heights */
    }
</style>
</head>
<body>
<%@include file="Component/navbar.jsp" %>

<div class="main-content">
    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card point-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">Librarian Login</p>
                        <form action="StaffLoginServlet" method="post">
                            <div class="mb-3">
                                <label for="email">Enter Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                            </div>
                            <button type="submit" class="btn btn-primary text-white col-md-12">Login</button>
                            
                           <div class="text-center mt-3">
                            <a href="staff_signup.jsp" class="text-primary text-decoration-none">Librarian SignUp?</a>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="Component/footer.jsp" %>
</body>
</html>
