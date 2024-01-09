<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page import="it.betacom.dao.impl.UtentiDaoImpl,it.betacom.model.Utenti,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista Utenti</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="./public/css/index.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
	<body>

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
	          				<a class="nav-link" href="Logout">${utente.getUsername()}</a>
	          				
	          				</c:otherwise>
	          			</c:choose>
	        		</li>
	      		</ul>
    			</div>
  		</div>
	</nav>
			
		<%
		UtentiDaoImpl uDi = new UtentiDaoImpl();
		List<Utenti> lista = uDi.getAllUser();
		//request.setAttribute("list", lista);
		%>
	
	<div class="container pt-5">
	<div class="row pt-5">

        <div class="col-md-12">
        <h4>Lista degli utenti</h4>
        <div class="table-responsive">
        
        <!-- MESSAGGIO DI ELIMINAZIONE AVVENUTA CON SUCCESSO -->
		<%
		String messaggioEliminazione = (String) session.getAttribute("messaggioEliminazione");
		if(messaggioEliminazione != null && !messaggioEliminazione.isEmpty()) {
		%>
		<div class="bg-warning text-light text-center rounded">
		<%= messaggioEliminazione %>
		</div>
		<%
		}
		session.removeAttribute("messaggioEliminazione");
		%>
  
              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                   		<th>Id</th>
						<th>Nome</th>
						<th>Cognome</th>
						<th>Email</th>
						<th>Username</th>
						<th>Stato</th>
						<th>Ruolo</th>
						<c:if test= "${sessionScope.utente.ruolo eq 'A'}">
						<th>Modifica</th>
                       	<th>Elimina</th>
                       	</c:if>
                   </thead>
                
    			<tbody>
    				<c:forEach items="<%= lista %>" var="u">
    					<tr class="user-raw" data-user-id="${u.getId()}">
						    <td>${u.getId()}</td>
						    <td>${u.getNome()}</td>
						    <td>${u.getCognome()}</td>
						    <td>${u.getEmail()}</td>
						    <td>${u.getUsername()}</td>
						    <td>${u.getStato()}</td>
						    <td>${u.getRuolo()}</td>
						    
						    <c:if test= "${sessionScope.utente.ruolo eq 'A'}">
						    <td>
						    	<a href="updateUtente.jsp?userId=${u.getId()}" class="btn btn-primary btn-xs">Modifica</a>
						    </td>
						    
		    				<td>
		    					<form action="DeleteUtente" method="post">
		    						<input type="hidden" name="userId" value="${u.getId()}">
			    						<button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Sei sicuro di voler eliminare l\'utente?')">
			    							<i class="fa-solid fa-trash"></i>
			    						</button>
		    					</form>
		    				</td>
		    				
				    		</c:if>
				    	</tr>
				    </c:forEach>
    			</tbody>
        
			</table>   
       </div>
       </div>
	</div>
	</div>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script src="public/js/listaUtenti.js"></script>
</body>
</html>

