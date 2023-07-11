package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "collection_story")
public class CollectionStory {
	
	@EmbeddedId
	private CollectionStoryId id;

	@ManyToOne
	@JoinColumn(name = "collection_id")
	@MapsId(value = "collectionId")
	private Collection collection;
	
	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	public CollectionStory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CollectionStory(CollectionStoryId id, Collection collection, Story story) {
		super();
		this.id = new CollectionStoryId(collection.getId(), story.getId());
		this.collection = collection;
		this.story = story;
	}

	public CollectionStoryId getId() {
		return id;
	}

	public void setId(CollectionStoryId id) {
		this.id = id;
	}

	public Collection getCollection() {
		return collection;
	}

	public void setCollection(Collection collection) {
		this.collection = collection;
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
		CollectionStory other = (CollectionStory) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CollectionStory [id=").append(id).append(", collection=").append(collection).append(", story=")
				.append(story).append("]");
		return builder.toString();
	}

}
