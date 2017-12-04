package com.spring.madi;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class NotificationVO {
	
	private int notice_id;
	private String notice_to;
	private String notice_from;
	private String notice_from_img;
	private String notice_from_name;
	private String content; 
	private String notice_type;
	private int check_not;
	private Timestamp time;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_to() {
		return notice_to;
	}
	public void setNotice_to(String notice_to) {
		this.notice_to = notice_to;
	}
	public String getNotice_from() {
		return notice_from;
	}
	public void setNotice_from(String notice_from) {
		this.notice_from = notice_from;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public int getCheck_not() {
		return check_not;
	}
	public void setCheck_not(int check_not) {
		this.check_not = check_not;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getNotice_from_img() {
		return notice_from_img;
	}
	public void setNotice_from_img(String notice_from_img) {
		this.notice_from_img = notice_from_img;
	}
	public String getNotice_from_name() {
		return notice_from_name;
	}
	public void setNotice_from_name(String notice_from_name) {
		this.notice_from_name = notice_from_name;
	}
	
	
}
