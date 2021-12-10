package tw.bus.ticket.model;

public class ByTripname {
	
	private String tripname;
	private String initstation;
	private String finalstation;
	private String traveldate;
	private String weekday;
	private String initialtime;
	private Integer adult;
	private Integer children;
	
	public ByTripname() {
	}

	public ByTripname(String tripname, String initstation, String finalstation, String traveldate, String weekday,
			String initialtime, Integer adult, Integer children) {
		this.tripname = tripname;
		this.initstation = initstation;
		this.finalstation = finalstation;
		this.traveldate = traveldate;
		this.weekday = weekday;
		this.initialtime = initialtime;
		this.adult = adult;
		this.children = children;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ByTripname [tripname=");
		builder.append(tripname);
		builder.append(", initstation=");
		builder.append(initstation);
		builder.append(", finalstation=");
		builder.append(finalstation);
		builder.append(", traveldate=");
		builder.append(traveldate);
		builder.append(", weekday=");
		builder.append(weekday);
		builder.append(", initialtime=");
		builder.append(initialtime);
		builder.append(", adult=");
		builder.append(adult);
		builder.append(", children=");
		builder.append(children);
		builder.append("]");
		return builder.toString();
	}

	public String getTripname() {
		return tripname;
	}

	public void setTripname(String tripname) {
		this.tripname = tripname;
	}

	public String getInitstation() {
		return initstation;
	}

	public void setInitstation(String initstation) {
		this.initstation = initstation;
	}

	public String getFinalstation() {
		return finalstation;
	}

	public void setFinalstation(String finalstation) {
		this.finalstation = finalstation;
	}

	public String getTraveldate() {
		return traveldate;
	}

	public void setTraveldate(String traveldate) {
		this.traveldate = traveldate;
	}

	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

	public String getInitialtime() {
		return initialtime;
	}

	public void setInitialtime(String initialtime) {
		this.initialtime = initialtime;
	}

	public Integer getAdult() {
		return adult;
	}

	public void setAdult(Integer adult) {
		this.adult = adult;
	}

	public Integer getChildren() {
		return children;
	}

	public void setChildren(Integer children) {
		this.children = children;
	}
	
	
	

	
	
	
	
}
