package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "author_tag")
public class AuthorTag {
	
	@EmbeddedId
	private AuthorTagId id;

	@ManyToOne
	@JoinColumn(name = "author_id")
	@MapsId(value = "authorId")
	private Author author;
	
	@ManyToOne
	@JoinColumn(name = "tag_id")
	@MapsId(value = "tagId")
	private Tag tag;
	

	public AuthorTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthorTag(AuthorTagId id, Author author, Tag tag) {
		super();
		this.id = new AuthorTagId(author.getId(), tag.getId());
		this.author = author;
		this.tag = tag;
	}

	public AuthorTagId getId() {
		return id;
	}

	public void setId(AuthorTagId id) {
		this.id = id;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
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
		AuthorTag other = (AuthorTag) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AuthorTag [id=").append(id).append(", author=").append(author).append(", tag=").append(tag)
				.append("]");
		return builder.toString();
	}

}
