package tw.bus.member.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsersRespository extends JpaRepository<Users, Integer> {
	// JPQL nativeQuery預設false
	@Query(value = "from Users where name like concat('%',?1,'%')") // concat():串接
	public List<Users> findUsers(String name);

	// 自訂命名規則方法，效果同上
	public List<Users> findByNameLike(String name);
	
	// 原生SQL語法
	@Query(value = "Select * from Users", nativeQuery = true)
	public List<Users> findAll();
}
