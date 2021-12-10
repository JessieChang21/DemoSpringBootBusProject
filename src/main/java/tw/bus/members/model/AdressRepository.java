package tw.bus.members.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdressRepository extends JpaRepository<AdressBean, Integer>  {

	public Optional<AdressBean> findById(Integer Id);
}
