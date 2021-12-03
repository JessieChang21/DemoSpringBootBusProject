package tw.bus.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Rank")
@Component
public class Rank {
	@Id
	private String RankID;
	private String RankName;
	public String getRankID() {
		return RankID;
	}
	public void setRankID(String rankID) {
		RankID = rankID;
	}
	public String getRankName() {
		return RankName;
	}
	public void setRankName(String rankName) {
		RankName = rankName;
	}
	
	
}
