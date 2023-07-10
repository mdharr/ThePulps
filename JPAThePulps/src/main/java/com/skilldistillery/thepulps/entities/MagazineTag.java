package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "magazine_tag")
public class MagazineTag {
	
	@EmbeddedId
	private MagazineTagId id;

	@ManyToOne
	@JoinColumn(name = "magazine_id")
	@MapsId(value = "magazineId")
	private Magazine magazine;
	
	@ManyToOne
	@JoinColumn(name = "tag_id")
	@MapsId(value = "tagId")
	private Tag tag;
	

	public MagazineTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazineTag(MagazineTagId id, Magazine magazine, Tag tag) {
		super();
		this.id = new MagazineTagId(magazine.getId(), tag.getId());
		this.magazine = magazine;
		this.tag = tag;
	}

	public MagazineTagId getId() {
		return id;
	}

	public void setId(MagazineTagId id) {
		this.id = id;
	}

	public Magazine getMagazine() {
		return magazine;
	}

	public void setMagazine(Magazine magazine) {
		this.magazine = magazine;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
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
		MagazineTag other = (MagazineTag) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazineTag [id=").append(id).append(", magazine=").append(magazine).append(", tag=")
				.append(tag).append("]");
		return builder.toString();
	}

}
