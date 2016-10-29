package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.ChiTietHoaDon;
import util.HibernateUtil;

public class ChiTietHoaDonDAOImpl implements ChiTietHoaDonDAO {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	@Override
	public void themChiTietHoaDon(ChiTietHoaDon cthd) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(cthd);
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
	public List<ChiTietHoaDon> getListCTHDByMHD(int ma_hoa_don) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<ChiTietHoaDon> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM ChiTietHoaDon Where ma_hoa_don='" + ma_hoa_don
							+ "' ORDER BY ma_chi_tiet_hd ASC").list();
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
