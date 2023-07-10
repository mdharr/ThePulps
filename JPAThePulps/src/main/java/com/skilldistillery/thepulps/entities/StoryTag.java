package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "story_tag")
public class StoryTag {
	
	@EmbeddedId
	private StoryTagId id;

	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	@ManyToOne
	@JoinColumn(name = "tag_id")
	@MapsId(value = "tagId")
	private Tag tag;
	

	public StoryTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryTag(StoryTagId id, Story story, Tag tag) {
		super();
		this.id = new StoryTagId(story.getId(), tag.getId());
		this.story = story;
		this.tag = tag;
	}

	public StoryTagId getId() {
		return id;
	}

	public void setId(StoryTagId id) {
		this.id = id;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
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
		StoryTag other = (StoryTag) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryTag [id=").append(id).append(", story=").append(story).append(", tag=").append(tag)
				.append("]");
		return builder.toString();
	}

}
