package it.betacom.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.betacom.model.Utenti;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final int TENTATIVI_LOGIN_MAX = 3;
	protected static final Logger logger = LogManager.getLogger("Login");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		TypedQuery<Utenti> query = em.createQuery(
				"SELECT u FROM Utenti u WHERE u.email = :email", Utenti.class);
		query.setParameter("email", email);
		
		List<Utenti> utenti = query.getResultList();
		if(!utenti.isEmpty()) {
			Utenti utente = utenti.get(0);
			
			if(utente.getStato().equals("D")) {
				request.setAttribute("messDisabilitato", "Gentile " + utente.getUsername() + " per motivi di sicurezza il suo account è stato disabilitato, la invitiamo a contattare il supporto tecnico");
				logger.debug(Utenti.class.getName() + " - " + "Utente " + utente.getUsername() + " " + utente.getEmail() + " ha provato ad effettuare l'accesso");
			} else {
				if(utente.getPassword().equals(password)) {
					//Reset contatore login falliti
					utente.setTentativiAccesso(0);
					em.getTransaction().begin();
					em.merge(utente);
					em.getTransaction().commit();
					
//					//Recupero dei dati degli utenti
//					TypedQuery<Utenti> allUsersQuery = em.createNamedQuery("utenti.findAll", Utenti.class);
//					List<Utenti> allUsers = allUsersQuery.getResultList();
//					request.setAttribute("utentiList", allUsers);
					
					request.getSession().setAttribute("utente", utente);
					response.sendRedirect("index.jsp");
					logger.debug(Utenti.class.getName() + " - " + "Utente " + utente.getUsername() + " " + utente.getEmail() + " ha effettuati il login");
					return; //Necessario per terminare il metodo dopo il reindirizzamento
				} else {
					//Incremento contatore login falliti
					utente.setTentativiAccesso(utente.getTentativiAccesso()+1);
					
					if(utente.getTentativiAccesso() >= TENTATIVI_LOGIN_MAX) {
						utente.setStato("D");
					}
					
					em.getTransaction().begin();
					em.merge(utente);
					em.getTransaction().commit();
					
					if(utente.getStato().equals("D")) {
						logger.debug(Utenti.class.getName() + " - " + "Utente " + utente.getUsername() + " " + utente.getEmail() + " è stato diabilitato, tentativo n. " + utente.getTentativiAccesso());
						request.setAttribute("messDisabilitato", "Ci dispiace ma il tuo account per motivi di sicurezza è stato disabilitato, contatta il supporto tecnico per maggiori informazioni");
					}else {
						logger.debug(Utenti.class.getName() + " - " + "Utente " + utente.getUsername() + " " + utente.getEmail() + " ha sbagliato password, tentativo n. " + (TENTATIVI_LOGIN_MAX - utente.getTentativiAccesso()));
						request.setAttribute("messaggioErrore", "Sembra che la password inserita non sia corretta, hai a disposizione al massimo " + (TENTATIVI_LOGIN_MAX - utente.getTentativiAccesso()) + " tentativi");
					}
				}
			}
			
		} 
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
