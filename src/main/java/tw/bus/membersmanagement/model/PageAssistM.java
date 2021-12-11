package tw.bus.membersmanagement.model;

import java.util.List;

public class PageAssistM {

	private List<QueryMembers> list;
	
	private long tolpages;
	
	private long pageEles;

	public List<QueryMembers> getList() {
		return list;
	}

	public void setList(List<QueryMembers> list) {
		this.list = list;
	}

	public long getTolpages() {
		return tolpages;
	}

	public void setTolpages(long tolpages) {
		this.tolpages = tolpages;
	}

	public long getPageEles() {
		return pageEles;
	}

	public void setPageEles(long pageEles) {
		this.pageEles = pageEles;
	}
		
}
