package tw.bus.membersmanagement.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface QueryMembersRepository extends JpaRepository<QueryMembers, Long> {

	public Optional<QueryMembers> findByEmail(String email);

}
