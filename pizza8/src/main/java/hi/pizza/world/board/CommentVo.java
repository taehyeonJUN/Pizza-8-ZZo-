package hi.pizza.world.board;

import java.util.Date;

public class CommentVo 
{
	private int rpId;
	private String rpUser;
	private String rpText;
	private int rpBbsid;
	private Date rpDate;
	
	public int getRpId() {
		return rpId;
	}
	public void setRpId(int rpId) {
		this.rpId = rpId;
	}
	public String getRpUser() {
		return rpUser;
	}
	public void setRpUser(String rpUser) {
		this.rpUser = rpUser;
	}
	public String getRpText() {
		return rpText;
	}
	public void setRpText(String rpText) {
		this.rpText = rpText;
	}
	public int getRpBbsid() {
		return rpBbsid;
	}
	public void setRpBbsid(int rpBbsid) {
		this.rpBbsid = rpBbsid;
	}
	public Date getRpDate() {
		return rpDate;
	}
	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}
}
