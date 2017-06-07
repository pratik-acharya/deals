package edu.mum.deals.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class DealNotFoundException  extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	private String reason = "No Deal found under id ";
	public DealNotFoundException(long id) {
		this.reason = this.reason+id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
	

}
