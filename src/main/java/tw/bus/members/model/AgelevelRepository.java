package tw.bus.members.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AgelevelRepository extends JpaRepository<AgelevelBean, Integer> {

	public Optional<AgelevelBean> findByAgeid(Integer ageid);
}
