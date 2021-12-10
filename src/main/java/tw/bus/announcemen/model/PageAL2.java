package tw.bus.announcemen.model;

import java.util.List;



public class PageAL2 {

private List<LostAndFound> list;
	
	private long tolpages;
	
	private long pageEles;

	public List<LostAndFound> getList() {
		return list;
	}

	public void setList(List<LostAndFound> list) {
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
