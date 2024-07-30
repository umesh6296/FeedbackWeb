package com.feedback.dto;

import java.sql.Date;



public class DateDTO extends GenDTO {
	private Date date;

	public DateDTO(boolean status, String message, Exception exception, Date date) {
		super(status, message, exception);
		this.date = date;
	}

	public Date getDate() {
		return date;
	}

	}
