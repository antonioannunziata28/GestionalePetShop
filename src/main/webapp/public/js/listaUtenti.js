function openEditModal(userId)	{
	
	//Chiamata Ajax per recuperare i dati dell'utente
	$.get("getUserDetails?userId=" + userId, function(data){
		//Popolazione del modulo di modifica
		$("#editUserId").val(data.id);
		$("#editNome").val(data.nome);
        $("#editCognome").val(data.cognome);
        $("#editUsername").val(data.username);
        $("#editEmail").val(data.email);
        $("#editNumero").val(data.numero);
        $("#editRuolo").val(data.ruolo);
        $("#editStato").val(data.stato);
        $("#editTentativiLogin").val(data.tentativiAccesso);
        
        $("#editModal").modal("show");
	})
}

function openDeleteModal(userId) {
		$("#deleteUserId").val(data.id);
		$("#deleteNome").val(data.nome);
        $("#deleteCognome").val(data.cognome);
        $("#deleteUsername").val(data.username);
        $("#deleteEmail").val(data.email);
        $("#deleteNumero").val(data.numero);
        $("#deleteRuolo").val(data.ruolo);
        $("#deleteStato").val(data.stato);
        $("#deleteTentativiLogin").val(data.tentativiAccesso);
        
        $("#deleteModal").modal("show");
}