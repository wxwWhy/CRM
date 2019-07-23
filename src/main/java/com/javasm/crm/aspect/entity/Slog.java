package com.javasm.crm.aspect.entity;

import java.io.Serializable;
import java.math.BigInteger;


public class Slog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1403564211784750872L;
	
	private Integer id;

	private String content;

	private Integer logtype;

	private String time;

	private Integer userid;
	
	private String username;
	
	private String timedate;

	public Slog(Integer id, String content, Integer logtype, String time, Integer userid, String username,
			String timedate) {
		super();
		this.id = id;
		this.content = content;
		this.logtype = logtype;
		this.time = time;
		this.userid = userid;
		this.username = username;
		this.timedate = timedate;
	}

	public Slog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getLogtype() {
		return logtype;
	}

	public void setLogtype(Integer logtype) {
		this.logtype = logtype;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTimedate() {
		return timedate;
	}

	public void setTimedate(String timedate) {
		this.timedate = timedate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Slog [id=" + id + ", content=" + content + ", logtype=" + logtype + ", time=" + time + ", userid="
				+ userid + ", username=" + username + ", timedate=" + timedate + "]";
	}
	



}
