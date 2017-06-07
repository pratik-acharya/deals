package edu.mum.deals.deal.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import edu.mum.deals.user.domain.User;
@Entity
public class Enquiry {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private Deal deal;
	
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	@NotBlank
	@Size(min =2, max = 100 , message = "{Size.length}")
	private String content;
	
	@Temporal(TemporalType.DATE)
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Deal getDeal() {
		return deal;
	}
	public void setDeal(Deal deal) {
		this.deal = deal;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	
	

}