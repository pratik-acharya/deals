package edu.mum.deals.user.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

import edu.mum.deals.deal.domain.Deal;
import edu.mum.deals.user.validation.ValidEmail;


@Entity
@DynamicUpdate
public class User implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private long id;
	@NotBlank
	private String name;
	@ValidEmail
	private String email;
	private String password;
	private String photo;
    @Enumerated(EnumType.ORDINAL)
    private Status status = Status.ACTIVE;
   // @Valid
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "phone_id")
	private PhoneNumber phone;
   // @Valid
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "location_id")
	private Location location;
	
	@OneToMany(mappedBy = "user", fetch=FetchType.EAGER)
	private Set<Deal> deals = new HashSet<>();
	@ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(name="UserRole",
				joinColumns = {@JoinColumn(name = "user_id")},
				inverseJoinColumns = {@JoinColumn(name="role_id")})
	private Set<Role> roles = new HashSet<>();
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public PhoneNumber getPhone() {
		return phone;
	}
	public void setPhone(PhoneNumber phone) {
		this.phone = phone;
	}
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}


	

}
