package tw.bus.schedule.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SeatRepository extends JpaRepository<Seats, Integer> {
	public void deleteByBusNumber(Integer busNumber);
	public Seats findByBusNumberAndSeats(Integer busNumber, Integer seats);
}
