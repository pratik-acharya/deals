package edu.mum.deals.user.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String content;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User reviewer;
	@ManyToOne 
	@JoinColumn(name="reviewed_user_id")
	private User reviewee;
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getReviewer() {
		return reviewer;
	}
	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}
	public User getReviewee() {
		return reviewee;
	}
	public void setReviewee(User reviewee) {
		this.reviewee = reviewee;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}