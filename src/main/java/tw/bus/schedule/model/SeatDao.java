package tw.bus.schedule.model;
//package tw.leonchen.schedule.model;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//
//@Repository
//@Transactional
//public class SeatDao {
//	@Autowired
//    private SessionFactory sessionFactory;
//	
//	public void deleteByBusNumber(Integer busNumber) {
//		Session session = sessionFactory.openSession();
//		Transaction tx= session.beginTransaction();
//		String hqlstr = "delete from Seats as s where s.busNumber ='"+ busNumber+"'" ;
//		
//		session.createQuery(hqlstr).executeUpdate();
//		tx.commit();
//		
//		session.close();
//		
//	}
//}
