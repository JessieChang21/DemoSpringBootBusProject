//package tw.bus.member.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import tw.bus.member.model.*;
//
//
//@RestController
//@RequestMapping("/users")
//public class UsersController {
//	@Autowired
//	private UsersService uService;
//
//	//http://localhost:8081/users/findusers1.controller
//	@GetMapping("/findusers1.controller")
//	public List<Users> processFindUsersAction1() {
//		return uService.findUsers("ma");
//	}
//
//	@GetMapping("/findusers2.controller")
//	public List<Users> processFindUsersAction2(@RequestParam("name") String name) {
//		return uService.findByNameLike("%" + name + "%");
//	}
//
//	@GetMapping("/findallusers.controller")
//	public List<Users> processAllUsers() {
//		return uService.findAll();
//	}
//
//}
