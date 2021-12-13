package tw.bus.memberslike.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="totallikebydate")
@Component
public class TotalFrameBean {

	@Id
	@Column(name = "DATE")
	private String date;
	
	@Column(name = "FRAME1")
	private Integer frame1;
	
	@Column(name = "FRAME2")
	private Integer frame2;
	
	@Column(name = "FRAME3")
	private Integer frame3;
	
	@Column(name = "FRAME4")
	private Integer frame4;
	
	@Column(name = "FRAME5")
	private Integer frame5;
	
	@Column(name = "FRAME6")
	private Integer frame6;
	
	@Column(name = "FRAME7")
	private Integer frame7;
	
	@Column(name = "FRAME8")
	private Integer frame8;
	
	@Column(name = "FRAME9")
	private Integer frame9;
	
	@Column(name = "FRAME10")
	private Integer frame10;
	
	@Column(name = "FRAME11")
	private Integer frame11;
	
	@Column(name = "FRAME12")
	private Integer frame12;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getFrame1() {
		return frame1;
	}

	public void setFrame1(Integer frame1) {
		this.frame1 = frame1;
	}

	public Integer getFrame2() {
		return frame2;
	}

	public void setFrame2(Integer frame2) {
		this.frame2 = frame2;
	}

	public Integer getFrame3() {
		return frame3;
	}

	public void setFrame3(Integer frame3) {
		this.frame3 = frame3;
	}

	public Integer getFrame4() {
		return frame4;
	}

	public void setFrame4(Integer frame4) {
		this.frame4 = frame4;
	}

	public Integer getFrame5() {
		return frame5;
	}

	public void setFrame5(Integer frame5) {
		this.frame5 = frame5;
	}

	public Integer getFrame6() {
		return frame6;
	}

	public void setFrame6(Integer frame6) {
		this.frame6 = frame6;
	}

	public Integer getFrame7() {
		return frame7;
	}

	public void setFrame7(Integer frame7) {
		this.frame7 = frame7;
	}

	public Integer getFrame8() {
		return frame8;
	}

	public void setFrame8(Integer frame8) {
		this.frame8 = frame8;
	}

	public Integer getFrame9() {
		return frame9;
	}

	public void setFrame9(Integer frame9) {
		this.frame9 = frame9;
	}

	public Integer getFrame10() {
		return frame10;
	}

	public void setFrame10(Integer frame10) {
		this.frame10 = frame10;
	}

	public Integer getFrame11() {
		return frame11;
	}

	public void setFrame11(Integer frame11) {
		this.frame11 = frame11;
	}

	public Integer getFrame12() {
		return frame12;
	}

	public void setFrame12(Integer frame12) {
		this.frame12 = frame12;
	}

	
}
