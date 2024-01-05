<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register PetShop</title>
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
              <h3 class="login-heading mb-4">Benvenuto!</h3>

              <!-- Register Form -->
              <form action="/GestionalePetShop/Register" method="post">
                <div class="form-floating mb-3">
                  <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
                  <label for="email">Indirizzo Email</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="name" placeholder="Marco" name="name">
                  <label for="name">Nome</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="surname" placeholder="Rossi" name="surname">
                  <label for="surname">Cognome</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="tel" class="form-control" id="tel" placeholder="3331343233" name="mobilePhone">
                  <label for="mobilePhone">Cellulare</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="date" class="form-control" id="dateOfBirth" placeholder="01-01-1988" name="dateOfBirth">
                  <label for="dateOfBirth">Data di nascita</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                  <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="confirmPassword" placeholder="Password" name="confirmPassword">
                  <label for="confirmPassword">Conferma password</label>
                </div>

                <div class="d-grid">
                  <button class="btn btn-lg btn-login text-uppercase fw-bold mb-2" type="submit">Registrati</button>
                  <div class="text-center">
                    <a class="small" href="login.jsp">Sei già registrato?</a>
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