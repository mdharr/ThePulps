package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "magazine_story")
public class MagazineStoryId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "story_id")
	private int storyId;
	
	@Column(name = "magazine_id")
	private int magazineId;

	public MagazineStoryId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazineStoryId(int storyId, int magazineId) {
		super();
		this.storyId = storyId;
		this.magazineId = magazineId;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getMagazineId() {
		return magazineId;
	}

	public void setMagazineId(int magazineId) {
		this.magazineId = magazineId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(magazineId, storyId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MagazineStoryId other = (MagazineStoryId) obj;
		return magazineId == other.magazineId && storyId == other.storyId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazineStoryId [storyId=").append(storyId).append(", magazineId=").append(magazineId)
				.append("]");
		return builder.toString();
	}
	
}
