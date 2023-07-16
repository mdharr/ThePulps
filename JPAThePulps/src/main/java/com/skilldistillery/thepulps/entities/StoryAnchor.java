package com.skilldistillery.thepulps.entities;

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
		this.id = new StoryAnchorId(story.getId(), magazineHtml.getId);
		this.story = story;
		this.magazineHtml = magazineHtml;
	}

}
