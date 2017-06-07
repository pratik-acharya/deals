package edu.mum.deals.deal.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Image {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String fileName;
	private String description;
//	@ManyToOne
//	@JoinColumn(name = "deal_id")
//	private Deal deal;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
//	public Deal getDeal() {
//		return deal;
//	}
//	public void setDeal(Deal deal) {
//		this.deal = deal;
//	}
	
	

}
