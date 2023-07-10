package com.skilldistillery.thepulps.entities;

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

}
