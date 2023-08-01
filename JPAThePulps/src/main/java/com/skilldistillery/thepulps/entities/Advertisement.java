package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Advertisement {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name = "magazine_id")
	private Magazine magazine;
	
	@Column(name = "released_at")
	private LocalDateTime releasedAt;

	public Advertisement() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Advertisement(int id, Magazine magazine, LocalDateTime releasedAt) {
		super();
		this.id = id;
		this.magazine = magazine;
		this.releasedAt = releasedAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Magazine getMagazine() {
		return magazine;
	}

	public void setMagazine(Magazine magazine) {
		this.magazine = magazine;
	}

	public LocalDateTime getReleasedAt() {
		return releasedAt;
	}

	public void setReleasedAt(LocalDateTime releasedAt) {
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
		Advertisement other = (Advertisement) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Advertisement [id=").append(id).append(", magazine=").append(magazine).append(", releasedAt=")
				.append(releasedAt).append("]");
		return builder.toString();
	}
	
}
