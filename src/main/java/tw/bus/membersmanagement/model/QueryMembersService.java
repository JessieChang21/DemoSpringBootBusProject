package tw.bus.membersmanagement.model;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.bus.exception.UserNotFoundException;
import tw.bus.members.model.Members;

@Service
@Transactional
public class QueryMembersService {
	
	@Autowired
	QueryMembersRepository qRep;

	public Page<QueryMembers> findAllByPage(Pageable pageable) {
		
		return qRep.findAll(pageable);
	}

	public QueryMembers findByEmail(String email) {
		Optional<QueryMembers> opl = qRep.findByEmail(email);
		 
		 if(opl.isEmpty()) {
			 throw new UserNotFoundException("Can't find user!");
		 }
		 return opl.get();
	}

	public QueryMembers updateMembers(QueryMembers qmembers) {
		return qRep.save(qmembers);
	}

}

