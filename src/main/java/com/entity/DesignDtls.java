package com.entity;

public class DesignDtls {
	
	private int designId;
	private String designName;
	private String designer;
	private String price;
	private String designCategory;
    private String status;
    private String photoName;
    private String email;
    
	public DesignDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DesignDtls(String designName, String designer, String price, String designCategory, String status,
			String photoName, String email) {
		super();
		this.designName = designName;
		this.designer = designer;
		this.price = price;
		this.designCategory = designCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	public int getDesignId() {
		return designId;
	}

	public void setDesignId(int designId) {
		this.designId = designId;
	}

	public String getDesignName() {
		return designName;
	}

	public void setDesignName(String designName) {
		this.designName = designName;
	}

	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDesignCategory() {
		return designCategory;
	}

	public void setDesignCategory(String designCategory) {
		this.designCategory = designCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "DesignDtls [designId=" + designId + ", designName=" + designName + ", designer=" + designer + ", price="
				+ price + ", designCategory=" + designCategory + ", status=" + status + ", photoName=" + photoName
				+ ", email=" + email + "]";
	}
    
    
}
