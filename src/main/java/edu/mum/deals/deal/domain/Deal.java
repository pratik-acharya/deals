package edu.mum.deals.deal.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import edu.mum.deals.user.domain.User;

@Entity
public class Deal {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@NotBlank
	private String title;
	@NotBlank
	@Lob
	private String description;
	@NotBlank
	private String type;
	@NotNull
	@Min(value=1)
	private double price;
	private boolean used = true;
	private boolean negotiable = true;
	@Column(name = "d_condition")
	private String condition;
	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;
	@Temporal(TemporalType.TIMESTAMP)
	private Date until;
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "deal_id")
	private List<Enquiry> enquiries = new ArrayList<>();
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	@Transient
	private MultipartFile image;

	@PrePersist
	protected void onCreate() {
		timestamp = new Date();
	}

	 @PreUpdate
	 protected void onUpdate() {
		 timestamp = new Date();
	 }
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Enquiry> getEnquiries() {
		return enquiries;
	}

	public void setEnquiries(List<Enquiry> enquiries) {
		this.enquiries = enquiries;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isUsed() {
		return used;
	}

	public void setUsed(boolean used) {
		this.used = used;
	}

	public boolean isNegotiable() {
		return negotiable;
	}

	public void setNegotiable(boolean negotiable) {
		this.negotiable = negotiable;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Deal [id=" + id + ", title=" + title + ", description=" + description + ", type=" + type + ", price="
				+ price + ", used=" + used + ", negotiable=" + negotiable + ", condition=" + condition + ", enquiries="
				+ enquiries + ", user=" + user + ", category=" + category + "]";
	}

}
