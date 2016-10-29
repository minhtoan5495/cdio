package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import util.HibernateUtil;
import model.User;

public class UserDAOImpl implements UserDAO {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void insertUser(User u) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(u);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public User getUser(int user_id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		User u = null;
		try {
			tx = session.beginTransaction();
			u = (User) session.createQuery(
					"FROM User where user_id='" + user_id + "'").uniqueResult();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkLogin(String username, String password) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<User> u = null;
		try {
			tx = session.beginTransaction();
			u = session.createQuery(
					"FROM User where username='" + username
							+ "' and password='" + password + "'").list();
			tx.commit();
			if (u.size() >= 1) {
				return true;
			}
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkUsername(String username) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<User> u = null;
		try {
			tx = session.beginTransaction();
			u = session.createQuery(
					"FROM User where username='" + username + "'").list();
			tx.commit();
			if (u.size() >= 1) {
				return true;
			}
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean checkRole(String username) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<User> u = null;
		try {
			tx = session.beginTransaction();
			u = session.createQuery(
					"FROM User where username='" + username
							+ "'and role= 1").list();
			tx.commit();
			if (u.size() >= 1) {
				return true;
			}
				
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}
	@Override
	public void deleteUser(int user_id){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        User user= new User();
        user.setUser_id(user_id);
        session.delete(user);
        session.getTransaction().commit();
        session.close();       
    }
	@Override
	public void updateUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        session.close();
    }
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
        List<User> users = null;
		try {
			tx = session.beginTransaction();
			users = session.createQuery("FROM User ORDER BY user_id ASC").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return users; 
	}

}
