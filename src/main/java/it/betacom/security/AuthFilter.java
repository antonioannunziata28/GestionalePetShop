package it.betacom.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebFilter("/listaUtenti.jsp") //Se utilizzata questa annotazione non c'è bisogno di indicare il filtro nel file web.xml
public class AuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession(false);
		
		if(session != null && session.getAttribute("utente") != null) {
			//Utente loggato, procedo con la richiesta
			chain.doFilter(request, response);
		} else {
			//Utente non loggato
			httpResponse.sendRedirect("login.jsp");
		}
		
	}

}
