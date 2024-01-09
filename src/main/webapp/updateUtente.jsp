<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="it.betacom.dao.impl.UtentiDaoImpl,it.betacom.model.Utenti"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update utente</title>
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
              <h3 class="login-heading mb-4">Modifica i dati!</h3>
              
              <%
              	String userId = request.getParameter("userId");
              	UtentiDaoImpl uDao = new UtentiDaoImpl();
              	Utenti u = uDao.readUtenteById(Integer.parseInt(userId));%>
              
              
              

              <!-- Register Form -->
              <form id="editForm" action="UpdateUser" method="post">
              	
              	<input type="hidden" id="userId" name="userId" value="<%= u.getId() %>">
              	<input type="hidden" id="dateOfBirth" name="dateOfBirth" value="<%= u.getDataNascita() %>">
              	<input type="hidden" id="password" name="password" value="<%= u.getPassword() %>">
              
                <div class="form-floating mb-3">
                  <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email" required value="<%= u.getEmail() %>">
                  <label for="email">Indirizzo Email</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="username" placeholder="paro88" name="username" required value="<%= u.getUsername() %>">
                  <label for="username">Username</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="name" placeholder="Marco" name="name" required value="<%= u.getNome() %>">
                  <label for="name">Nome</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="surname" placeholder="Rossi" name="surname" required value="<%= u.getCognome() %>">
                  <label for="surname">Cognome</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="tel" class="form-control" id="mobilePhone" placeholder="3331343233" name="mobilePhone" required value="<%= u.getTelefono() %>">
                  <label for="mobilePhone">Cellulare</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="role" placeholder="G" name="role" required value="<%= u.getRuolo() %>">
                  <label for="role">Ruolo</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="state" placeholder="A" name="state" required value="<%= u.getStato() %>">
                  <label for="state">Stato</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="number" class="form-control" id="loginAttempts" placeholder="0" name="loginAttempts" required value="<%= u.getTentativiAccesso() %>">
                  <label for="loginAttempts">Tentativi di accesso</label>
                </div>
                <div class="d-grid">
                  <button class="btn btn-lg btn-login text-uppercase fw-bold mb-2" type="submit">Salva</button>
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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="public/js/updateUtente.js"></script>
  </body>
</html>