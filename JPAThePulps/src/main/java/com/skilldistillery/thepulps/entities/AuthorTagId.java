package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "author_tag")
public class AuthorTagId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "author_id")
	private int authorId;
	
	@Column(name = "tag_id")
	private int tagId;

	public AuthorTagId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthorTagId(int authorId, int tagId) {
		super();
		this.authorId = authorId;
		this.tagId = tagId;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
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
		return Objects.hash(authorId, tagId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AuthorTagId other = (AuthorTagId) obj;
		return authorId == other.authorId && tagId == other.tagId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AuthorTagId [authorId=").append(authorId).append(", tagId=").append(tagId).append("]");
		return builder.toString();
	}

}
