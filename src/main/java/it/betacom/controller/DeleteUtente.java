package it.betacom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.impl.UtentiDaoImpl;

/**
 * Servlet implementation class DeleteUtente
 */
@WebServlet("/DeleteUtente")
public class DeleteUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUtente() {
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
		UtentiDaoImpl uDi = new UtentiDaoImpl();

		request.getSession().setAttribute("messaggioEliminazione", "Utente " + uDi.readUtenteById(userId).getUsername() + " eliminato correttamente");
		uDi.deleteUtente(uDi.readUtenteById(userId));
		response.sendRedirect("listaUtenti.jsp");
		
		
		doGet(request, response);
	}

}
