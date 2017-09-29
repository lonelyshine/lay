package com.cy.ssm.beans;

import java.io.Serializable;
import java.sql.Date;

public class UserBean implements Serializable {

	
	private static final long serialVersionUID = -2682305557890221059L;
	private Integer userId;
	private String userCode;
	private String userName;
	private String userPassword;
	private Integer age;
	private String sex;
	private Date birthday;
	private String tel;
	private String qq;
	private String email;
	private String emailUser;
	private String emailPassword;
	private String verfiyCode;
	private String address;
	private String avatar;
	private String brief;
	public UserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserBean(Integer userId, String userCode, String userPassword, String userName,Integer age,String sex,Date birthday,String tel,String qq,String email,String emailUser,String emailPassword,String verfiyCode,String address,String avatar,String brief) {
		super();
		this.userId = userId;
		this.userCode = userCode;
		this.userPassword = userPassword;
		this.userName = userName;
		this.age = age;
		this.sex = sex;
		this.birthday = birthday;
		this.tel = tel;
		this.qq = qq;
		this.email = email;
		this.emailUser=emailUser;
		this.emailPassword = emailPassword;
		this.verfiyCode = verfiyCode;
		this.address = address;
		this.avatar = avatar;
		this.brief = brief;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getVerfiyCode() {
		return verfiyCode;
	}
	public void setVerfiyCode(String verfiyCode) {
		this.verfiyCode = verfiyCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", userName=" + userName + ", userCode="
				+ userCode + ", userPassword=" + userPassword + ", age=" + age + ",sex ="
				+ sex + ", birthday=" + birthday + ", tel=" + tel + ", qq=" + qq + ",email=" + email + ",emailUser=" + emailUser + ", emailPassword=" + emailPassword + ",verfiyCode=" + verfiyCode + ",address=" + address + ",avatar=" + avatar + ",brief=" + brief + "]";
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmailUser() {
		return emailUser;
	}
	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	public String getEmailPassword() {
		return emailPassword;
	}
	public void setEmailPassword(String emailPassword) {
		this.emailPassword = emailPassword;
	}
}

