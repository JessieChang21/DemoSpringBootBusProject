package tw.bus.members.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface CityRepository extends JpaRepository<CityBean, Integer> {

	public Optional<CityBean> findByCityname(String cityname);


}
