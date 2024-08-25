<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
<%@include file="Component/allcss.jsp" %>
<style>
  /* Add shadow to carousel images */
  .carousel-inner img {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  }
</style>
</head>
<body>
<%@include file="Component/navbar.jsp" %>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/lib3.png" class="d-block w-100" alt="..." height="550px">
    </div>
    <div class="carousel-item">
      <img src="img/lib2.png" class="d-block w-100" alt="..." height="550px">
    </div>
    <div class="carousel-item">
      <img src="img/lib1.jpeg" class="d-block w-100" alt="..." height="550px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="container p-3">
  <p class="text-center fs-2"> Key Features of Our Library</p>

  <div class="row">
    <div class="col-md-4">
      <div class="card border-primary mb-3">
        <div class="card-header">Patan College for Professional Studies Library</div>
        <div class="card-body text-primary">
          <h5 class="card-title">Extensive Resource Collection</h5>
          <p class="card-text">The library at Patan College for Professional Studies boasts a comprehensive 
          collection of books, journals, and digital resources, catering to diverse academic disciplines. 
          This extensive resource base empowers students and faculty with the knowledge they need for research,
           study, and professional development.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card border-secondary mb-3">
        <div class="card-header">Patan College for Professional Studies Library</div>
        <div class="card-body text-secondary">
          <h5 class="card-title">Modern Study Environment</h5>
          <p class="card-text">The library offers a modern, well-equipped study environment with 
          comfortable seating, quiet study areas, and high-speed internet access. These facilities
           are designed to foster focused learning and collaboration, ensuring that students have
            the ideal setting to achieve their academic goals.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <img alt="Library Image" src="img/lib4.png" class="img-fluid">
    </div>
  </div>
</div>
<hr>
<%@include file="Component/footer.jsp" %>
</body>
</html>
