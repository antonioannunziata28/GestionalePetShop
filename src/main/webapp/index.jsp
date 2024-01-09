<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetShop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="./public/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">PetShop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Servizi</a>
        </li>
        <c:if test="${not empty sessionScope.utente}">
        	<li class="nav-item">
        		<a class="nav-link" href="listaUtenti.jsp">Lista utenti</a>
        	</li>
        </c:if>
        
        <li class="nav-item">
        	<c:choose>
        		<c:when test="${empty sessionScope.utente}">
        			<a class="nav-link" href="login.jsp">Area riservata</a>
        		</c:when>
          	<c:otherwise>
          			<a class="nav-link" href="Logout">Logout</a>
          	</c:otherwise>
          	</c:choose>
        </li>
      </ul>
    </div>
  </div>
</nav>

<header>

  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active" style="background-image: url('https://www.cronoshare.it/assets/ld/test/img/l-peluqueria-canina-25873b6c5dee9d6544dfde04f3130da2.jpg')">
        <div class="carousel-caption">
          <h5>Servizi di toelettatura</h5>
          <p>Usiamo i migliori prodotti per prenderci cura del tuo cane</p>
        </div>
      </div>
      <div class="carousel-item" style="background-image: url('https://www.flamingo.be/it/itr-glide-asset/3fe77157ac93410db18a1b39043ec14f/eyJ3IjoyMDAwLCJoIjo2MDAsImZpdCI6ImNyb3AiLCJmbSI6ImpwZyIsInMiOiI1NDkyNTIyYjVhMGNmMzE3NGI0YzM1ZjNhNTc4NjhiZSJ9.jpg')">
        <div class="carousel-caption">
          <h5>Accessori & Giocattoli</h5>
          <p>Solo da noi puoi trovare un vasto assortimenti di accessori e giochi per i tuoi animali</p>
        </div>
      </div>
      <div class="carousel-item" style="background-image: url('https://agricommerciogardencenter.edagricole.it/wp-content/uploads/sites/12/2020/03/Fediaf-Etic_tibi_2_2020_agrasdelic__81164.jpg')">
        <div class="carousel-caption">
          <h5>Alimentazione & Cura</h5>
          <p>Ampia gamma di prodotti a disposizione per prenderti cura del tuo animale domestico</p>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</header>

<!-- Page Content -->
<section class="py-5">
  <div class="container">
    <h1 class="fw-light">PetShop</h1>
    
  </div>
</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>