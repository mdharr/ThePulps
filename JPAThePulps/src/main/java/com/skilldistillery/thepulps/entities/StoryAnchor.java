package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "story_anchor")
public class StoryAnchor {
	
	@EmbeddedId
	private StoryAnchorId id;
	
	@Column(name = "anchor_tag")
	private String anchorTag;

	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	@ManyToOne
	@JoinColumn(name = "magazine_html_id")
	@MapsId(value = "magazineHtmlId")
	private MagazineHtml magazineHtml;

	public StoryAnchor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoryAnchor(StoryAnchorId id, Story story, MagazineHtml magazineHtml) {
		super();
		this.id = new StoryAnchorId(story.getId(), magazineHtml.getId());
		this.story = story;
		this.magazineHtml = magazineHtml;
	}

	public StoryAnchorId getId() {
		return id;
	}

	public void setId(StoryAnchorId id) {
		this.id = id;
	}

	public String getAnchorTag() {
		return anchorTag;
	}

	public void setAnchorTag(String anchorTag) {
		this.anchorTag = anchorTag;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public MagazineHtml getMagazineHtml() {
		return magazineHtml;
	}

	public void setMagazineHtml(MagazineHtml magazineHtml) {
		this.magazineHtml = magazineHtml;
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
		StoryAnchor other = (StoryAnchor) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryAnchor [id=").append(id).append(", anchorTag=").append(anchorTag).append(", story=")
				.append(story).append(", magazineHtml=").append(magazineHtml).append("]");
		return builder.toString();
	}

}
