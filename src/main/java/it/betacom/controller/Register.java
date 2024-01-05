package it.betacom.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.betacom.dao.impl.UtentiDaoImpl;
import it.betacom.model.Utenti;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UtentiDaoImpl utenteDaoImpl = new UtentiDaoImpl();
	protected static final Logger logger = LogManager.getLogger("Register");
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		String nome = request.getParameter("name");
		String cognome = request.getParameter("surname");
		String dataNascita = request.getParameter("dateOfBirth");
		String cellulare = request.getParameter("mobilePhone");
		String password = request.getParameter("password");
		String username = generateUsername(nome, cognome, dataNascita);
		
		
		SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");
		Date dataParsata = null;
		try {
			dataParsata = formatoData.parse(dataNascita);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(dataNascita);
		
		Utenti utente = new Utenti(email, nome, cognome, cellulare, dataParsata, password, username);
		
		utenteDaoImpl.createUtente(utente);
		logger.debug(Utenti.class.getName() + " - " + "Utente registrato correttamente: " + nome + " " + cognome);
		request.getSession().setAttribute("messaggioRegistrazione", "Utente " + username + " registrato correttamente");
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private String generateUsername(String nome, String cognome, String dataNascita) {
		
		String partialUsername = nome.substring(0,2) + cognome.substring(0,2) + dataNascita.substring(dataNascita.lastIndexOf("-") +1);
		String username = partialUsername;
		int count = 1;
		
		
		while(utenteDaoImpl.readUserByUsername(username) != null) {
			username = partialUsername + "_" + count;
			count++;
		}
		
		return username;
			
	}
	
	

}
