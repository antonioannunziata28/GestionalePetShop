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

import it.betacom.dao.impl.UtentiDaoImpl;
import it.betacom.model.Utenti;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String username = request.getParameter("username");
		String mobilePhone = request.getParameter("mobilePhone");
		
		String stringDate = request.getParameter("dateOfBirth");
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
		
		Date dateOfBirth = null;
		try {
			dateOfBirth = dateFormat.parse(stringDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String role = request.getParameter("role");
		String state = request.getParameter("state");
		String password = request.getParameter("password");
		String loginAttempts = request.getParameter("loginAttempts");
		
		UtentiDaoImpl uDi = new UtentiDaoImpl();
		Utenti utente = uDi.readUtenteById(userId);
		
		utente.setEmail(email);
		utente.setNome(name);
		utente.setCognome(surname);
		utente.setUsername(username);
		utente.setTelefono(mobilePhone);
		utente.setDataNascita(dateOfBirth);
		utente.setRuolo(role);
		utente.setStato(state);
		utente.setTentativiAccesso(Integer.parseInt(loginAttempts));
		utente.setPassword(password);
		
		uDi.updateUtente(utente);

		String successMessage = "Modifica effettuata con successo";
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(successMessage);
		
		
		doGet(request, response);
	}

}
