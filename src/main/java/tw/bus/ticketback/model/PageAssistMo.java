package tw.bus.ticketback.model;

import java.util.List;


public class PageAssistMo {

	private List<Memberorder> list;
	
	private int tolpages;
	
	private long pageEles;

	public List<Memberorder> getList() {
		return list;
	}

	public void setList(List<Memberorder> list) {
		this.list = list;
	}

	public int getTolpages() {
		return tolpages;
	}

	public void setTolpages(int tolpages) {
		this.tolpages = tolpages;
	}

	public long getPageEles() {
		return pageEles;
	}

	public void setPageEles(long pageEles) {
		this.pageEles = pageEles;
	}
	
	
}
