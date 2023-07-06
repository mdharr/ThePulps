package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Magazine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@Column(name = "cover_artwork_id") // REPLACE AFTER CREATING COVER_ARTWORK ENTITY!!!
	private CoverArtwork coverArtwork;
	
	@ManyToOne
	@Column(name = "publication_id")
	private Publication publication;
	
	private String name;
	
	@Column(name = "released_at")
	private String releasedAt;

	public Magazine() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Magazine(int id, CoverArtwork coverArtwork, Publication publication, String name, String releasedAt) {
		super();
		this.id = id;
		this.coverArtwork = coverArtwork;
		this.publication = publication;
		this.name = name;
		this.releasedAt = releasedAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public CoverArtwork getCoverArtwork() {
		return coverArtwork;
	}

	public void setCoverArtwork(CoverArtwork coverArtwork) {
		this.coverArtwork = coverArtwork;
	}

	public Publication getPublication() {
		return publication;
	}

	public void setPublication(Publication publication) {
		this.publication = publication;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReleasedAt() {
		return releasedAt;
	}

	public void setReleasedAt(String releasedAt) {
		this.releasedAt = releasedAt;
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
		Magazine other = (Magazine) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Magazine [id=").append(id).append(", coverArtwork=").append(coverArtwork)
				.append(", publication=").append(publication).append(", name=").append(name).append(", releasedAt=")
				.append(releasedAt).append("]");
		return builder.toString();
	}
	
}
