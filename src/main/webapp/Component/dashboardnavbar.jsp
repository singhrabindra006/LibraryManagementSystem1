<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header with Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: brown;">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="index.jsp"><i class="fa-solid fa-book"></i>Library Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white" href="dashboard.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="BookHomePage.jsp"><i class="fa-solid fa-book-open"></i> Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="viewIssuedBook.jsp"><i class="fa-solid fa-cart-arrow-down"></i> Issue Books</a>
                </li>
               <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="addFine.jsp">
                   <i class="fa-solid fa-dollar-sign"></i> Add Fine
                   </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="returnBookByStudent.jsp"><i class="fas fa-undo"></i>Return Status</a>
                </li>
               
                <li class="nav-item">
                    <a class="nav-link text-white" href="RegisterUser.jsp"><i class="fa-solid fa-users"></i> Registered Students</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="index.jsp"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
