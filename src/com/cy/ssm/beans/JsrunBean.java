package com.cy.ssm.beans;

public class JsrunBean {
	private static final long serialVersionUID = -2682305557890221061L;
	
	private Integer Id;
	private Integer UserId;
	private String worksBrief;
	private String worksHtml;
	private String worksCss;
	private String worksJs;
	
	
	public JsrunBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JsrunBean(Integer Id, Integer UserId, String worksBrief, String worksHtml,String worksCss,String worksJs) {
		super();
		this.Id = Id;
		this.UserId = UserId;
		this.worksBrief = worksBrief;
		this.worksHtml = worksHtml;
		this.worksCss = worksCss;
		this.worksJs = worksJs;
	}
	@Override
	public String toString() {
		return "JsrunBean [Id=" + Id + ", UserId=" + UserId + ", worksBrief="
				+ worksBrief + ", worksHtml=" + worksHtml + ", worksCss=" + worksCss + ",worksJs=" + worksJs + "]";
	}
	
	
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public String getWorksBrief() {
		return worksBrief;
	}
	public void setWorksBrief(String worksBrief) {
		this.worksBrief = worksBrief;
	}
	public String getWorksHtml() {
		return worksHtml;
	}
	public void setWorksHtml(String worksHtml) {
		this.worksHtml = worksHtml;
	}
	public String getWorksCss() {
		return worksCss;
	}
	public void setWorksCss(String worksCss) {
		this.worksCss = worksCss;
	}
	public String getWorksJs() {
		return worksJs;
	}
	public void setWorksJs(String worksJs) {
		this.worksJs = worksJs;
	}
	
	
	
} 
