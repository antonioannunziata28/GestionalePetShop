function submitForm(){
	//Creo un oggetto con i dati del form
	var formData ={
		userId: $("#editUserId").val(),
		nome: $("#editNome").val(),
        cognome: $("#editCognome").val(),
        username: $("#editUsername").val(),
        email: $("#editEmail").val(),
        telefono: $("#editNumero").val(),
        ruolo: $("#editRuolo").val(),
        stato: $("#editStato").val(),
        tentativiLogin: $("#editTentativiLogin").val()
	}
	
	//Invio i dati del form al server tramite AJAX
	$.ajax({
		type: "POST",
		url: "UpdateUser",
		data: formData,
		success: function(response){
			//Gestione della risposta, feedback utente
			alert("Modifica effettuata con successo!");
			window.location.href = "listaUtenti.jsp";
		},
		error: function(error){
			console.error("Errore durante la modifica utente " + error);
			alert("Si è verificato un problema durante la modifica");
		}
	})
	
}