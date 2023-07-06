package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cover_artwork")
public class CoverArtwork {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "image_url")
	private String imageUrl;
	
    @OneToOne(mappedBy = "coverArtwork")
    private Magazine magazine;

	public CoverArtwork() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CoverArtwork(int id, String imageUrl, Magazine magazine) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.magazine = magazine;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Magazine getMagazine() {
		return magazine;
	}

	public void setMagazine(Magazine magazine) {
		this.magazine = magazine;
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
		CoverArtwork other = (CoverArtwork) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CoverArtwork [id=").append(id).append(", imageUrl=").append(imageUrl).append(", magazine=")
				.append(magazine).append("]");
		return builder.toString();
	}
	
}
