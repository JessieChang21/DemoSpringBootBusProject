package tw.bus.schedule.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BusTimeRepository extends JpaRepository<BusTimes, Integer> {
	public Page<BusTimes> findByRouteId(String routeId, Pageable pageable);
	public Integer deleteByBusNumber(Integer busNumber);
	public BusTimes findTopByRouteIdOrderByBusNumberDesc(String routeId);
}
