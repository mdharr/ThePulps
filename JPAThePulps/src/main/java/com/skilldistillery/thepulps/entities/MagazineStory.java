package com.skilldistillery.thepulps.entities;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "magazine_story")
public class MagazineStory {
	
	@EmbeddedId
	private MagazineStoryId id;

	@ManyToOne
	@JoinColumn(name = "magazine_id")
	@MapsId(value = "magazineId")
	private Magazine magazine;
	
	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	

	public MagazineStory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazineStory(MagazineStoryId id, Story story, Magazine magazine) {
		super();
		this.id = new MagazineStoryId(magazine.getId(), story.getId());
		this.magazine = magazine;
		this.story = story;
	}

	public MagazineStoryId getId() {
		return id;
	}

	public void setId(MagazineStoryId id) {
		this.id = id;
	}

	public Magazine getMagazine() {
		return magazine;
	}

	public void setMagazine(Magazine magazine) {
		this.magazine = magazine;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}
	
}
