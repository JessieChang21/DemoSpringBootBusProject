package tw.bus.member.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserProfilesRespository extends JpaRepository<UserProfiles, Integer> {
	public Optional<UserProfiles> findByName(String name);
}
