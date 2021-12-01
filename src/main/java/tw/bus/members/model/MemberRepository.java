package tw.bus.members.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Members, Long> {

	public Optional<Members> findByEmail(String email);

}
