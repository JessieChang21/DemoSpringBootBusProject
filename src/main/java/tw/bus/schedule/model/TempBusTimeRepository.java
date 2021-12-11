package tw.bus.schedule.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TempBusTimeRepository extends JpaRepository<TempBusTimes, Integer> {
	public Page<TempBusTimes> findByToExamine(Integer toExamine, Pageable pageable);
	public Optional<TempBusTimes> findByBusNumberPo(Integer busNumber);
	//待審查、已通過用
	public Page<TempBusTimes> findByToExamineOrToExamineOrToExamine(Integer toExamine1,Integer toExamine2,Integer toExamine3, Pageable pageable);
	//待修改
	public Page<TempBusTimes> findByToExamineOrToExamine(Integer toExamine1, Integer toExamine2, Pageable pageable);
		
}
