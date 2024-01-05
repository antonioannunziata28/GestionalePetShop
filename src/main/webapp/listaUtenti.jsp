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
	          				<a class="nav-link" href="Logout">Logout</a>
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
    				<c:forEach items="<%= lista %>" var="utente">
    					<tr class="user-raw" data-user-id="${utente.getId()}">
						    <td>${utente.getId()}</td>
						    <td>${utente.getNome()}</td>
						    <td>${utente.getCognome()}</td>
						    <td>${utente.getEmail()}</td>
						    <td>${utente.getUsername()}</td>
						    <td>${utente.getStato()}</td>
						    <td>${utente.getRuolo()}</td>
						    
						    <c:if test= "${sessionScope.utente.ruolo eq 'A'}">
						    <td>
						    	<p data-placement="top" data-toggle="tooltip" title="Edit">
						    		<button class="btn btn-primary btn-xs" data-title="Edit" onclick="openEditModal(${utente.getId()})">
						    			<i class="fa-solid fa-pencil"></i>
						    		</button>
						    	</p>
						    </td>
						    
		    				<td>
		    					<p data-placement="top" data-toggle="tooltip" title="Delete">
		    						<button class="btn btn-danger btn-xs" data-title="Delete" onclick="openDeleteModal(${utente.getId()})">
		    							<i class="fa-solid fa-trash"></i>
		    						</button>
		    					</p>
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


	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    		<div class="modal-content">
          		<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        			<h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      			</div>
       <div class="modal-body">
          	
         	<div class="form-group">
        		<input class="form-control " type="text" placeholder="Mohsin">
        	</div>
        	
        	<div class="form-group">
        		<input class="form-control " type="text" placeholder="Irshad">
        	</div>
        	
        <div class="form-group">
        	<textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
	
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

