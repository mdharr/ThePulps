package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "story_author")
public class StoryAuthor {
	
	@EmbeddedId
	private StoryAuthorId id;

	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	@ManyToOne
	@JoinColumn(name = "author_id")
	@MapsId(value = "authorId")
	private Author author;

	public StoryAuthor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoryAuthor(StoryAuthorId id, Story story, Author author) {
		super();
		this.id = new StoryAuthorId(story.getId(), author.getId());
		this.story = story;
		this.author = author;
	}

	public StoryAuthorId getId() {
		return id;
	}

	public void setId(StoryAuthorId id) {
		this.id = id;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
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
		StoryAuthor other = (StoryAuthor) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryAuthor [id=").append(id).append(", story=").append(story).append(", author=")
				.append(author).append("]");
		return builder.toString();
	}

}
