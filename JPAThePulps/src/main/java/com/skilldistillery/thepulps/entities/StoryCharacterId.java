package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "story_character")
public class StoryCharacterId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "story_id")
	private int storyId;
	
	@Column(name = "character_id")
	private int characterId;

	public StoryCharacterId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryCharacterId(int storyId, int characterId) {
		super();
		this.storyId = storyId;
		this.characterId = characterId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getCharacterId() {
		return characterId;
	}

	public void setCharacterId(int characterId) {
		this.characterId = characterId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(characterId, storyId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryCharacterId other = (StoryCharacterId) obj;
		return characterId == other.characterId && storyId == other.storyId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryCharacterId [storyId=").append(storyId).append(", characterId=").append(characterId)
				.append("]");
		return builder.toString();
	}
	
}
