<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Home Page</title>
    <%@include file ="Component/allcss.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar, .footer {
            flex-shrink: 0;
        }
        .content {
            flex: 1 0 auto;
            overflow-y: auto;
        }
        .card {
            cursor: pointer;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card i {
            color: brown;
            font-size: 2rem;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: brown;">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="BookHomePage.jsp"><i class="fa-solid fa-book"></i> Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white" href="BookHomePage.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="book-from.jsp"><i class="fa-solid fa-tags"></i> Add Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="searchBooks.jsp"><i class="fa-solid fa-user-edit"></i> Search Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="dashboard.jsp"><i class="fa-solid fa-sign-out-alt"></i>Back</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="content">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-3">

                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-tags"></i>
                            <h5 class="card-title">Add Book</h5>
                        </div>
                    </div>
            </div>
            <div class="col-md-3">
                
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-user-edit"></i>
                            <h5 class="card-title">Search Book</h5>
                        </div>
                    </div>
               
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-undo"></i>
                        <h5 class="card-title">Books Returned</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <%@include file ="Component/footer.jsp" %>
</div>

</body>
</html>
