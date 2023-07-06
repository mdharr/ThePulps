package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Story {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(name = "story_url")
	private String storyUrl;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name = "released_at")
	private String releasedAt;
	
	@Column(name = "page_count")
	private int pageCount;

	public Story() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Story(int id, String title, String storyUrl, LocalDateTime createdAt, String releasedAt, int pageCount) {
		super();
		this.id = id;
		this.title = title;
		this.storyUrl = storyUrl;
		this.createdAt = createdAt;
		this.releasedAt = releasedAt;
		this.pageCount = pageCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStoryUrl() {
		return storyUrl;
	}

	public void setStoryUrl(String storyUrl) {
		this.storyUrl = storyUrl;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getReleasedAt() {
		return releasedAt;
	}

	public void setReleasedAt(String releasedAt) {
		this.releasedAt = releasedAt;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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
		Story other = (Story) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Story [id=").append(id).append(", title=").append(title).append(", storyUrl=").append(storyUrl)
				.append(", createdAt=").append(createdAt).append(", releasedAt=").append(releasedAt)
				.append(", pageCount=").append(pageCount).append("]");
		return builder.toString();
	}
	
}
