package tw.bus.route.model;
//package tw.leonchen.route.model;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//@Repository
//@Transactional
//public class RouteInfoDao {
//	@Autowired
//    private SessionFactory sessionFactory;
//	
//	public List<RouteInfo> findRouteInfoById(String routeId){
//		Session session = sessionFactory.openSession();
//		String hqlstr = "from RouteInfo as r where r.routeId =:rid";
//		
//		List<RouteInfo> routeInfo = session.createQuery(hqlstr, RouteInfo.class)
//				.setParameter("rid", routeId)
//				.getResultList();
//		
//		
//		
//		System.out.println(routeInfo.size());
//		
//		System.out.println(routeInfo.get(3).getStation());
//		
//		session.close();
//		
//		return routeInfo;
//		
//	}
//	
//	
//	
//
//}
