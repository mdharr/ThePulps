package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "publication_tag")
public class PublicationTagId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "publication_id")
	private int publicationId;
	
	@Column(name = "tag_id")
	private int tagId;
	
	public PublicationTagId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PublicationTagId(int publicationId, int tagId) {
		super();
		this.publicationId = publicationId;
		this.tagId = tagId;
	}

	public int getPublicationId() {
		return publicationId;
	}

	public void setPublicationId(int publicationId) {
		this.publicationId = publicationId;
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
		return Objects.hash(publicationId, tagId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PublicationTagId other = (PublicationTagId) obj;
		return publicationId == other.publicationId && tagId == other.tagId;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PublicationTagId [publicationId=").append(publicationId).append(", tagId=").append(tagId)
		.append("]");
		return builder.toString();
	}

}
