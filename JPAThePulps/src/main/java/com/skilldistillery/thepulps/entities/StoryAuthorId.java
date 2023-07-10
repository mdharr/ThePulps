package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "magazine_story")
public class StoryAuthorId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "story_id")
	private int storyId;
	
	@Column(name = "author_id")
	private int authorId;

	public StoryAuthorId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryAuthorId(int storyId, int authorId) {
		super();
		this.storyId = storyId;
		this.authorId = authorId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(authorId, storyId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryAuthorId other = (StoryAuthorId) obj;
		return authorId == other.authorId && storyId == other.storyId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryAuthorId [storyId=").append(storyId).append(", authorId=").append(authorId).append("]");
		return builder.toString();
	}
	
}
