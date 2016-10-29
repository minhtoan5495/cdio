package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import util.HibernateUtil;
import model.Product;

public class ProductDAOImpl implements ProductDAO {

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	@Override
	public void insertProduct(Product p) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(p);
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
	public List<Product> getListProduct() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Product ORDER BY category_id ASC")
					.list();
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
	public List<Product> getListProductByCategory(int category_id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery(
					"FROM Product Where category_id='" + category_id
							+ "' ORDER BY product_id ASC").list();
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

	@Override
	public Product getProduct(int product_id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Product p = null;
		try {
			tx = session.beginTransaction();
			p = (Product) session.createQuery(
					"FROM Product where product_id='" + product_id + "'")
					.uniqueResult();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return p;
	}

	@Override
	public List<Product> getListProductByPagination(List<Product> list, int start, int end) {
		List<Product> result = new ArrayList<Product>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	@Override
	public void deleteProduct(int product_id){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Product product = new Product();
        product.setProduct_id(product_id);
        session.delete(product);
        session.getTransaction().commit();
        session.close();
    }
    @SuppressWarnings("unchecked")
    public int getLastId(){
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        Query queryResult = s.createQuery("FROM Product WHERE id=(SELECT max(product_id) FROM Product)");
        List<Product> list = queryResult.list();
        s.close();
        return list.get(0).getProduct_id();
    }
    @SuppressWarnings("unchecked")
	@Override
	public List<Product> getListProductByName(String name) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery(
					"FROM Product Where name='" + name
							+ "' ORDER BY product_id ASC").list();
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
}
