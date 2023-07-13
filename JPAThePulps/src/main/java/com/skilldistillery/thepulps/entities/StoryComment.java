package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "story_comment")
public class StoryComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	private String content;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@UpdateTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;
	
	@ManyToOne
	@JoinColumn(name = "parent_comment_id")
	@JsonIgnoreProperties("replies")
	private StoryComment parentComment;

	@OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL)
	private List<StoryComment> replies = new ArrayList<>();

	public StoryComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryComment(int id, User user, Story story, String content, LocalDateTime createdAt,
			LocalDateTime updatedAt, StoryComment parentComment, List<StoryComment> replies) {
		super();
		this.id = id;
		this.user = user;
		this.story = story;
		this.content = content;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.parentComment = parentComment;
		this.replies = replies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public StoryComment getParentComment() {
		return parentComment;
	}

	public void setParentComment(StoryComment parentComment) {
		this.parentComment = parentComment;
	}

	public List<StoryComment> getReplies() {
		return replies;
	}

	public void setReplies(List<StoryComment> replies) {
		this.replies = replies;
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
		StoryComment other = (StoryComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryComment [id=").append(id).append(", user=").append(user).append(", story=").append(story)
				.append(", content=").append(content).append(", createdAt=").append(createdAt).append(", updatedAt=")
				.append(updatedAt).append(", parentComment=").append(parentComment).append("]");
		return builder.toString();
	}

}
