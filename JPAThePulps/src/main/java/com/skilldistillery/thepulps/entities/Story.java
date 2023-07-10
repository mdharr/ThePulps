package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Story {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@OneToMany(mappedBy = "story")
	private List<StoryPdf> storyPdfs;

	public Story() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Story(int id, String title, LocalDateTime createdAt, List<StoryPdf> storyPdfs) {
		super();
		this.id = id;
		this.title = title;
		this.createdAt = createdAt;
		this.storyPdfs = storyPdfs;
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

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public List<StoryPdf> getStoryPdfs() {
		return storyPdfs;
	}

	public void setStoryPdfs(List<StoryPdf> storyPdfs) {
		this.storyPdfs = storyPdfs;
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
		builder.append("Story [id=").append(id).append(", title=").append(title).append(", createdAt=")
				.append(createdAt).append(", storyPdfs=").append(storyPdfs).append("]");
		return builder.toString();
	}
	
}
