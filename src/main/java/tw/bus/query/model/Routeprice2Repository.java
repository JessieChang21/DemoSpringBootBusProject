package tw.bus.query.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface Routeprice2Repository extends JpaRepository<Routeprice2, Integer> {

	Routeprice2 findByRouteid(String id);

}
