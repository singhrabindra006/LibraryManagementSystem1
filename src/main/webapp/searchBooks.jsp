<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Book</title>
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
            overflow-y: auto;
            padding-top: 70px; /* Space for fixed header */
            padding-bottom: 50px; /* Space for fixed footer */
        }
    </style>
</head>
<body>

<%@include file="Component/booknavbar.jsp" %>
<!-- Scrollable Content -->
<div class="content d-flex align-items-center justify-content-center">
    <div class="card text-center" style="width: 24rem;">
        <div class="card-body">
            <h3 class="card-title mb-4">Search Book</h3>
            <form action='SearchBookServlet'>
                <div class="form-group mb-3">
                    <input type="text" name="txtSearch" class="form-control" placeholder="Search Books">
                </div>
                <button type="submit" class="btn btn-primary">SEARCH</button>
                <a href="BookHomePage.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<!-- Fixed Footer -->
<div class="footer" style="position: fixed; bottom: 0; width: 100%;">
    <%@include file="Component/footer.jsp" %>
</div>

</body>
</html>
