package com.skilldistillery.thepulps.entities;

import java.util.Objects;

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

	public MagazineStory(MagazineStoryId id, Magazine magazine, Story story) {
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
		MagazineStory other = (MagazineStory) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazineStory [id=").append(id).append(", magazine=").append(magazine).append(", story=")
				.append(story).append("]");
		return builder.toString();
	}
	
}
