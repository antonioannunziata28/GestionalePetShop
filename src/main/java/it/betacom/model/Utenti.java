package it.betacom.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Utenti
 *
 */
@Entity
@Table(name = "Utenti")
@NamedQuery(name="utenti.findAll", query="SELECT p FROM Utenti p")

public class Utenti implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String email;
	private String nome;
	private String cognome;
	private String telefono;
	
	@Temporal(TemporalType.DATE)
	private Date dataNascita;
	private String password;
    private String username;
    private String ruolo;
	private String stato;
	private int tentativiAccesso;


	public Utenti() {
		super();
	}


	public Utenti(String email, String nome, String cognome, String telefono, Date dataNascita, String password,
			String username) {
		super();
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.password = password;
		this.username = username;
		this.ruolo = "G";
		this.stato = "A";
		this.tentativiAccesso = 0;
	}


	public int getId() {
		return id;
	}


	public String getEmail() {
		return email;
	}


	public String getNome() {
		return nome;
	}


	public String getCognome() {
		return cognome;
	}


	public String getTelefono() {
		return telefono;
	}


	public Date getDataNascita() {
		return dataNascita;
	}


	public String getPassword() {
		return password;
	}


	public String getUsername() {
		return username;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getRuolo() {
		return ruolo;
	}


	public String getStato() {
		return stato;
	}


	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}


	public void setStato(String stato) {
		this.stato = stato;
	}


	public int getTentativiAccesso() {
		return tentativiAccesso;
	}


	public void setTentativiAccesso(int tentativiAccesso) {
		this.tentativiAccesso = tentativiAccesso;
	}
	
	
	
   
}
