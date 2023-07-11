package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "story_character")
public class StoryCharacter {
	
	@EmbeddedId
	private StoryCharacterId id;

	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	@ManyToOne
	@JoinColumn(name = "character_id")
	@MapsId(value = "characterId")
	private Character character;

	public StoryCharacter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoryCharacter(StoryCharacterId id, Story story, Character character) {
		super();
		this.id = new StoryCharacterId(story.getId(), character.getId());
		this.story = story;
		this.character = character;
	}

	public StoryCharacterId getId() {
		return id;
	}

	public void setId(StoryCharacterId id) {
		this.id = id;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public Character getCharacter() {
		return character;
	}

	public void setCharacter(Character character) {
		this.character = character;
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
		StoryCharacter other = (StoryCharacter) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryCharacter [id=").append(id).append(", story=").append(story).append(", character=")
				.append(character).append("]");
		return builder.toString();
	}

}
