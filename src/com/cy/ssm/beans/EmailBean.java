package com.cy.ssm.beans;

import java.sql.Date;

public class EmailBean {
	private static final long serialVersionUID = -2682305557890221060L;
	private Integer emailId;
	private String emailUID;
	private String sender;
	private String recipients;
	private String copyRecipients;
	private String secretRecipients;
	private String title;
	private String content;
	private String thetime;
	private String upload;
	private String emailType;
	private String emailStatus;
	private String priority;
	private String replySign;
	private String isupload;
	private String emailSize;
	
	
	public EmailBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmailBean(Integer emailId, String emailUID, String sender, String recipients,String copyRecipients,String secretRecipients,String title,String content,String thetime,String upload,String emailType,String emailStatus,String priority, String replySign,String isupload,String emailSize) {
		super();
		this.emailId = emailId;
		this.emailUID = emailUID;
		this.sender = sender;
		this.recipients = recipients;
		this.copyRecipients = copyRecipients;
		this.secretRecipients = secretRecipients;
		this.title = title;
		this.content = content;
		this.thetime = thetime;
		this.upload = upload;
		this.emailType=emailType;
		this.emailStatus = emailStatus;
		this.priority = priority;
		this.replySign = replySign;
		this.isupload=isupload;
		this.emailSize = emailSize;
		
	}
	public Integer getEmailId() {
		return emailId;
	}
	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}
	public String getEmailUID() {
		return emailUID;
	}
	public void setEmailUID(String emailUID) {
		this.emailUID = emailUID;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
	public String getCopyRecipients() {
		return copyRecipients;
	}
	public void setCopyRecipients(String copyRecipients) {
		this.copyRecipients = copyRecipients;
	}
	public String getSecretRecipients() {
		return secretRecipients;
	}
	public void setSecretRecipients(String secretRecipients) {
		this.secretRecipients = secretRecipients;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThetime() {
		return thetime;
	}
	public void setThetime(String thetime) {
		this.thetime = thetime;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public String getEmailType() {
		return emailType;
	}
	public void setEmailType(String emailType) {
		this.emailType = emailType;
	}
	public String getEmailStatus() {
		return emailStatus;
	}
	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getReplySign() {
		return replySign;
	}
	public void setReplySign(String replySign) {
		this.replySign = replySign;
	}
	public String getIsupload() {
		return isupload;
	}
	public void setIsupload(String isupload) {
		this.isupload = isupload;
	}
	public String getEmailSize() {
		return emailSize;
	}
	public void setEmailSize(String emailSize) {
		this.emailSize = emailSize;
	}
	@Override
	public String toString() {
		return "EmailBean [emailId=" + emailId + ", emailUID=" + emailUID + ", sender="
				+ sender + ", recipients=" + recipients + ", copyRecipients=" + copyRecipients + ",secretRecipients ="
				+ secretRecipients + ", title=" + title + ", content=" + content + ", thetime=" + thetime + ",upload=" + upload + ",emailType=" + emailType + ", emailStatus="
				+ emailStatus + ",priority=" + priority + ", replySign=" + replySign + ", isupload=" + isupload + ",emailSize=" + emailSize + "]";
	}
}
