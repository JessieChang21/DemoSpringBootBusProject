package tw.bus.schedule.model;

import java.util.List;

public class PageAssistTB {
	
	private List<TempBusTimes> list;
	
	private int tolpages;
	
	private long pageEles;

	public List<TempBusTimes> getList() {
		return list;
	}

	public void setList(List<TempBusTimes> list) {
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
