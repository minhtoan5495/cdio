package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.HoaDon;
import util.HibernateUtil;

public class HoaDonDAOImpl implements HoaDonDAO{
	HoaDon hd = new HoaDon();
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	@Override
	public void themHoaDon(HoaDon hd) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(hd);
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
	public int getMaHD(HoaDon hd) {
		return hd.getMa_hoa_don();	
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<HoaDon> getListHD() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<HoaDon> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM HoaDon ORDER BY ma_hoa_don ASC")
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
	public void deleteHoaDon(int ma_hoa_don){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa_hoa_don(ma_hoa_don);
        session.delete(hoaDon);
        session.getTransaction().commit();
        session.close();
    }

}
