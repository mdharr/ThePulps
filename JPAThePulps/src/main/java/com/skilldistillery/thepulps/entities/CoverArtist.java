package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "cover_artist")
public class CoverArtist {
	
	@EmbeddedId
	private CoverArtistId id;

	@ManyToOne
	@JoinColumn(name = "cover_artwork_id")
	@MapsId(value = "coverArtworkId")
	private CoverArtwork coverArtwork;
	
	@ManyToOne
	@JoinColumn(name = "artist_id")
	@MapsId(value = "artistId")
	private Artist artist;
	
	public CoverArtist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CoverArtist(CoverArtistId id, CoverArtwork coverArtwork, Artist artist) {
		super();
		this.id = new CoverArtistId(coverArtwork.getId(), artist.getId());
		this.coverArtwork = coverArtwork;
		this.artist = artist;
	}

	public CoverArtistId getId() {
		return id;
	}

	public void setId(CoverArtistId id) {
		this.id = id;
	}

	public CoverArtwork getCoverArtwork() {
		return coverArtwork;
	}

	public void setCoverArtwork(CoverArtwork coverArtwork) {
		this.coverArtwork = coverArtwork;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
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
		CoverArtist other = (CoverArtist) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CoverArtist [id=").append(id).append(", coverArtwork=").append(coverArtwork).append("]");
		return builder.toString();
	}
	
}
