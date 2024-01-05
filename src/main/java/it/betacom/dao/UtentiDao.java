package it.betacom.dao;

import java.util.List;

import it.betacom.model.Utenti;

public interface UtentiDao {

	List<Utenti> getAllUser();
	void createUtente(Utenti utente);
	Utenti readUtenteById(int id);
	void updateUtente(Utenti utente);
	void deleteUtente(Utenti utente);
}
