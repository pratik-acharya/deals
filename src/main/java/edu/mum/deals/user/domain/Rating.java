package edu.mum.deals.user.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Rating {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int rating;
	@ManyToOne
	@JoinColumn(name ="rater_user_id")
	private User rater;
	@ManyToOne
	@JoinColumn(name="rated_user_id")
	private User ratedUser;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public User getRater() {
		return rater;
	}
	public void setRater(User rater) {
		this.rater = rater;
	}
	public User getRatedUser() {
		return ratedUser;
	}
	public void setRatedUser(User ratedUser) {
		this.ratedUser = ratedUser;
	}

	

}
