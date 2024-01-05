<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login PetShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="./public/css/login.css" rel="stylesheet">
  </head>
  <body>
  
  <div class="container-fluid ps-md-0">
  <div class="row g-0">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
            	
            	<!-- MESSAGGIO DI REGISTRAZIONE AVVENUTA CON SUCCESSO -->
				    <%
				      String messaggioRegistrazione = (String)session.getAttribute("messaggioRegistrazione");
				      if(messaggioRegistrazione != null && !messaggioRegistrazione.isEmpty()) {
				    %>
				       <div class="bg-warning text-light text-center rounded">
				        <%= messaggioRegistrazione %>
				       </div>
				     <% }
				      	session.removeAttribute("messaggioRegistrazione");%>
				     
				<!-- MESSAGGIO DISABILITAZIONE ACCOUNT -->
					<%
						String accountDisabilitato = (String)request.getAttribute("messDisabilitato");
						if(accountDisabilitato != null && !accountDisabilitato.isEmpty()) {
					%>
						<div class="bg-danger text-light text-center rounded">
				        <%= accountDisabilitato %>
				       </div>
				    <% } %>
				  
				<!-- MESSAGGIO ERRORE PASSWORD -->
					<%
						String errorePass = (String)request.getAttribute("messaggioErrore");
						if(errorePass != null && !errorePass.isEmpty()) {
					%>
						<div class="bg-danger text-light text-center rounded">
				        <%= errorePass %>
				       </div>
				    <% } %>
				 
              <h3 class="login-heading mb-4">Bentornato!</h3>

              <!-- Sign In Form -->
              <form action="/GestionalePetShop/Login" method="post">
                <div class="form-floating mb-3">
                  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
                  <label for="floatingInput">Indirizzo Email</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                  <label for="floatingPassword">Password</label>
                </div>

                <div class="d-grid">
                  <button class="btn btn-lg btn-login text-uppercase fw-bold mb-2" type="submit">Accedi</button>
                  <div class="text-center">
                    <a class="small" href="register.jsp">Non sei ancora registrato?</a>
                  </div>
                </div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
</html>