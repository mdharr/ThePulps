package com.skilldistillery.thepulps.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "cover_artist")
public class CoverArtistId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "cover_artwork_id")
	private int coverArtworkId;
	
	@Column(name = "artist_id")
	private int artistId;

	public CoverArtistId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CoverArtistId(int coverArtworkId, int artistId) {
		super();
		this.coverArtworkId = coverArtworkId;
		this.artistId = artistId;
	}

	public int getCoverArtworkId() {
		return coverArtworkId;
	}

	public void setCoverArtworkId(int coverArtworkId) {
		this.coverArtworkId = coverArtworkId;
	}

	public int getArtistId() {
		return artistId;
	}

	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(artistId, coverArtworkId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CoverArtistId other = (CoverArtistId) obj;
		return artistId == other.artistId && coverArtworkId == other.coverArtworkId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CoverArtistId [coverArtworkId=").append(coverArtworkId).append(", artistId=").append(artistId)
				.append("]");
		return builder.toString();
	}
	
}
