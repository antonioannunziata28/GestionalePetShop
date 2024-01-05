package it.betacom.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import it.betacom.dao.UtentiDao;
import it.betacom.model.Utenti;

public class UtentiDaoImpl implements UtentiDao {
//	private EntityManagerFactory emf;
//	
//	public UtentiDaoImpl() {
//		emf = Persistence.createEntityManagerFactory("GestionalePetShop");
//	}

	@Override
	public List<Utenti> getAllUser() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			return em.createQuery("SELECT u FROM Utenti u", Utenti.class).getResultList();
		} finally {
			em.close();
			emf.close();
		}
	}

	@Override
	public void createUtente(Utenti utente) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			em.persist(utente);
			em.getTransaction().commit();
		} catch(Exception e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			} e.printStackTrace();
			System.out.println("Errore nella creazione dell'utente");
		} finally {
			em.close();
			emf.close();
		}

	}

	@Override
	public Utenti readUtenteById(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			return em.find(Utenti.class, id);
		} finally {
			em.close();
			emf.close();
		}
		
	}

	public Utenti readUserByUsername(String username) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			Query query = em.createQuery("SELECT u FROM Utenti u WHERE u.username = :username");
			query.setParameter("username", username);
			List<Utenti> result = query.getResultList();
			return result.isEmpty() ? null : result.get(0);
			
		} finally {
			em.close();
			emf.close();
		}
	}
	
	@Override
	public void updateUtente(Utenti utente) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			em.merge(utente);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			if(em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		} finally {
			em.close();
			emf.close();
		}

	}

	@Override
	public void deleteUtente(Utenti utente) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionalePetShop");
		EntityManager em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			Utenti utenteFromDb = em.find(Utenti.class, utente.getId());
			
			if(utenteFromDb != null) {
				em.remove(utenteFromDb);
				em.getTransaction().commit();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			if(em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			
		} finally {
			em.close();
			emf.close();
		}

	}
	
	

}
