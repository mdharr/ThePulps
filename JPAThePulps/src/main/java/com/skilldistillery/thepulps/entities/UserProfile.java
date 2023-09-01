package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "user_profile")
public class UserProfile {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	private String bio;
	
	@Column(name = "banner_url")
	private String bannerUrl;
	
	@JsonIgnore
	@OneToOne(mappedBy = "userProfile")
	private User user;

	public UserProfile() {
		super();
	}

	public UserProfile(int id, String imageUrl, String bio, String bannerUrl, User user) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.bio = bio;
		this.bannerUrl = bannerUrl;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getBannerUrl() {
		return bannerUrl;
	}

	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserProfile other = (UserProfile) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "UserProfile [id=" + id + ", imageUrl=" + imageUrl + ", bio=" + bio + ", bannerUrl=" + bannerUrl
				+ ", user=" + user + "]";
	}

}
