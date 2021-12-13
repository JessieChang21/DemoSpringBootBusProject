package tw.bus.memberslike.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="Frames")
@Component
public class UpdateFrameBean {


	@Id @Column(name = "USERID")
	private Long userid;
	
	@Column(name = "FRAME1")
	private String frame1;
	
	@Column(name = "FRAME2")
	private String frame2;
	
	@Column(name = "FRAME3")
	private String frame3;
	
	@Column(name = "FRAME4")
	private String frame4;
	
	@Column(name = "FRAME5")
	private String frame5;
	
	@Column(name = "FRAME6")
	private String frame6;
	
	@Column(name = "FRAME7")
	private String frame7;
	
	@Column(name = "FRAME8")
	private String frame8;
	
	@Column(name = "FRAME9")
	private String frame9;
	
	@Column(name = "FRAME10")
	private String frame10;
	
	@Column(name = "FRAME11")
	private String frame11;
	
	@Column(name = "FRAME12")
	private String frame12;

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getFrame1() {
		return frame1;
	}

	public void setFrame1(String frame1) {
		this.frame1 = frame1;
	}

	public String getFrame2() {
		return frame2;
	}

	public void setFrame2(String frame2) {
		this.frame2 = frame2;
	}

	public String getFrame3() {
		return frame3;
	}

	public void setFrame3(String frame3) {
		this.frame3 = frame3;
	}

	public String getFrame4() {
		return frame4;
	}

	public void setFrame4(String frame4) {
		this.frame4 = frame4;
	}

	public String getFrame5() {
		return frame5;
	}

	public void setFrame5(String frame5) {
		this.frame5 = frame5;
	}

	public String getFrame6() {
		return frame6;
	}

	public void setFrame6(String frame6) {
		this.frame6 = frame6;
	}

	public String getFrame7() {
		return frame7;
	}

	public void setFrame7(String frame7) {
		this.frame7 = frame7;
	}

	public String getFrame8() {
		return frame8;
	}

	public void setFrame8(String frame8) {
		this.frame8 = frame8;
	}

	public String getFrame9() {
		return frame9;
	}

	public void setFrame9(String frame9) {
		this.frame9 = frame9;
	}

	public String getFrame10() {
		return frame10;
	}

	public void setFrame10(String frame10) {
		this.frame10 = frame10;
	}

	public String getFrame11() {
		return frame11;
	}

	public void setFrame11(String frame11) {
		this.frame11 = frame11;
	}

	public String getFrame12() {
		return frame12;
	}

	public void setFrame12(String frame12) {
		this.frame12 = frame12;
	}

}
