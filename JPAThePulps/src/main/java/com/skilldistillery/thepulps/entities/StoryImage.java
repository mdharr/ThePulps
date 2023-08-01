package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "story_image")
public class StoryImage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "story_id")
	private Story story;
	
	@Column(name = "image_url")
	private String imageUrl;

	public StoryImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryImage(int id, Story story, String imageUrl) {
		super();
		this.id = id;
		this.story = story;
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		StoryImage other = (StoryImage) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryImage [id=").append(id).append(", story=").append(story).append(", imageUrl=")
				.append(imageUrl).append("]");
		return builder.toString();
	}

}
