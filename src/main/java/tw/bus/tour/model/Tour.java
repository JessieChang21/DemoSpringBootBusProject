package tw.bus.tour.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Tour")
@Component
public class Tour {
	@Id
	@Column(name = "tourId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourId;
	@Column(name = "tourName")
	private String tourName;
	@Column(name = "tourPrice")
	private int tourPrice;
	@Column(name = "discountPrice")
	private int discountPrice;
	@Column(name = "fk_tour_routeId")
	private String fk_tour_routeId;
	@Column(name = "tourContent")
	private String tourContent;
	@Column(name = "tourSaleStart")
	private String tourSaleStart;
	@Column(name = "tourSaleEnd")
	private String tourSaleEnd;
	@Column(name = "tourUseStart")
	private String tourUseStart;
	@Column(name = "tourUseEnd")
	private String tourUseEnd;
	@Column(name = "tourURL")
	private String tourURL;

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public int getTourPrice() {
		return tourPrice;
	}

	public void setTourPrice(int tourPrice) {
		this.tourPrice = tourPrice;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getFk_tour_routeId() {
		return fk_tour_routeId;
	}

	public void setFk_tour_routeId(String fk_tour_routeId) {
		this.fk_tour_routeId = fk_tour_routeId;
	}

	public String getTourContent() {
		return tourContent;
	}

	public void setTourContent(String tourContent) {
		this.tourContent = tourContent;
	}

	public String getTourSaleStart() {
		return tourSaleStart;
	}

	public void setTourSaleStart(String tourSaleStart) {
		this.tourSaleStart = tourSaleStart;
	}

	public String getTourSaleEnd() {
		return tourSaleEnd;
	}

	public void setTourSaleEnd(String tourSaleEnd) {
		this.tourSaleEnd = tourSaleEnd;
	}

	public String getTourUseStart() {
		return tourUseStart;
	}

	public void setTourUseStart(String tourUseStart) {
		this.tourUseStart = tourUseStart;
	}

	public String getTourUseEnd() {
		return tourUseEnd;
	}

	public void setTourUseEnd(String tourUseEnd) {
		this.tourUseEnd = tourUseEnd;
	}

	public String getTourURL() {
		return tourURL;
	}

	public void setTourURL(String tourURL) {
		this.tourURL = tourURL;
	}

}
