package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "magazine_tag")
public class MagazineTagId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "magazine_id")
	private int magazineId;
	
	@Column(name = "tag_id")
	private int tagId;

	public MagazineTagId() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MagazineTagId(int magazineId, int tagId) {
		super();
		this.magazineId = magazineId;
		this.tagId = tagId;
	}

	public int getMagazineId() {
		return magazineId;
	}

	public void setMagazineId(int magazineId) {
		this.magazineId = magazineId;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(magazineId, tagId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MagazineTagId other = (MagazineTagId) obj;
		return magazineId == other.magazineId && tagId == other.tagId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazineTagId [magazineId=").append(magazineId).append(", tagId=").append(tagId).append("]");
		return builder.toString();
	}

}
