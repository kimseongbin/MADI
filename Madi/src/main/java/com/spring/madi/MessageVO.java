package com.spring.madi;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
@Component
public class MessageVO {
	
	private int message_id;
	private String user_id;
	private String content;
	private Timestamp time;
	private String sender_id;
	private int check_msg;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public int getCheck_msg() {
		return check_msg;
	}
	public void setCheck_msg(int check_msg) {
		this.check_msg = check_msg;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	
	

}
