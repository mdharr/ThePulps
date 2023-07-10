package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "story_tag")
public class StoryTagId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "story_id")
	private int storyId;
	
	@Column(name = "tag_id")
	private int tagId;

	public StoryTagId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryTagId(int storyId, int tagId) {
		super();
		this.storyId = storyId;
		this.tagId = tagId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(storyId, tagId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryTagId other = (StoryTagId) obj;
		return storyId == other.storyId && tagId == other.tagId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryTagId [storyId=").append(storyId).append(", tagId=").append(tagId).append("]");
		return builder.toString();
	}

}
