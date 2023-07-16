package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "story_anchor")
public class StoryAnchorId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "story_id")
	private int storyId;
	
	@Column(name = "magazine_html_id")
	private int magazineHtmlId;

	public StoryAnchorId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryAnchorId(int storyId, int magazineHtmlId) {
		super();
		this.storyId = storyId;
		this.magazineHtmlId = magazineHtmlId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getMagazineHtmlId() {
		return magazineHtmlId;
	}

	public void setMagazineHtmlId(int magazineHtmlId) {
		this.magazineHtmlId = magazineHtmlId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(magazineHtmlId, storyId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryAnchorId other = (StoryAnchorId) obj;
		return magazineHtmlId == other.magazineHtmlId && storyId == other.storyId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryAnchorId [storyId=").append(storyId).append(", magazineHtmlId=").append(magazineHtmlId)
				.append("]");
		return builder.toString();
	}

}
