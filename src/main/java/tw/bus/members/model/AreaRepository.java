package tw.bus.members.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface AreaRepository extends JpaRepository<AreaBean, Integer> {

	public Optional<AreaBean> findByAreaname(String Areaname);
}
