package tw.bus.query.model;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

public interface RouteRepository extends JpaRepository<tw.bus.query.model.Route, String> {

	public List<tw.bus.query.model.Route> findByStation(String station);


}
