package tw.bus.membersmanagement.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class QueryMembersService {
	
	@Autowired
	QueryMembersRepository qRep;

	public Page<QueryMembers> findAllByPage(Pageable pageable) {
		
		return qRep.findAll(pageable);
	}

}
