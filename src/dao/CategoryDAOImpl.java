package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import util.HibernateUtil;
import model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void insertCategory(Category c) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(c);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategoryByParent() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Category> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Category where parent = 0").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategory() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Category> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Category ORDER BY category_id ASC").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategoryChildren() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Category> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Category where parent > 0").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategoryByChildren(int parent) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Category> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery(
					"FROM Category where parent='" + parent + "'").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public void deleteCategory(int category_id){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Category category = new Category();
        category.setCategory_id(category_id);
        session.delete(category);
        session.getTransaction().commit();
        session.close();
    }
	public void updateCategory(Category c) {
		Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(c);
        session.getTransaction().commit();
        session.close();
	}

}
