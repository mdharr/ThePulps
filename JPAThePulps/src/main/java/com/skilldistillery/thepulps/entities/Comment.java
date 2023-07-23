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
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "post_id")
	private Post post;
    
	@JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String content;
    
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "parent_comment_id")
	@JsonIgnoreProperties("replies")
	private Comment parentComment;

	@JsonIgnore
	@OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL)
	@OrderBy("createdAt ASC")
	private List<Comment> replies = new ArrayList<>();

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int id, Post post, User user, String content, LocalDateTime createdAt, Comment parentComment,
			List<Comment> replies) {
		super();
		this.id = id;
		this.post = post;
		this.user = user;
		this.content = content;
		this.createdAt = createdAt;
		this.parentComment = parentComment;
		this.replies = replies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
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

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public Comment getParentComment() {
		return parentComment;
	}

	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}

	public List<Comment> getReplies() {
		return replies;
	}

	public void setReplies(List<Comment> replies) {
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
		Comment other = (Comment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [id=").append(id).append(", post=").append(post).append(", user=").append(user)
				.append(", content=").append(content).append(", createdAt=").append(createdAt).append("]");
		return builder.toString();
	}

}
