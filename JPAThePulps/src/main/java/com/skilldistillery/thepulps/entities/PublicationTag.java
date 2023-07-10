package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "publication_tag")
public class PublicationTag {
	
	@EmbeddedId
	private PublicationTagId id;

	@ManyToOne
	@JoinColumn(name = "publication_id")
	@MapsId(value = "publicationId")
	private Publication publication;
	
	@ManyToOne
	@JoinColumn(name = "tag_id")
	@MapsId(value = "tagId")
	private Tag tag;
	

	public PublicationTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PublicationTag(PublicationTagId id, Publication publication, Tag tag) {
		super();
		this.id = new PublicationTagId(publication.getId(), tag.getId());
		this.publication = publication;
		this.tag = tag;
	}

	public PublicationTagId getId() {
		return id;
	}

	public void setId(PublicationTagId id) {
		this.id = id;
	}

	public Publication getPublication() {
		return publication;
	}

	public void setPublication(Publication publication) {
		this.publication = publication;
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
		PublicationTag other = (PublicationTag) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PublicationTag [id=").append(id).append(", publication=").append(publication).append(", tag=")
				.append(tag).append("]");
		return builder.toString();
	}

}
