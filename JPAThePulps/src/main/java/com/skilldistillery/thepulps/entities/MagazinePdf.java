package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "magazine_pdf")
public class MagazinePdf {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "magazine_url")
	private String magazineUrl;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "magazine_id")
	private Magazine magazine;

	public MagazinePdf() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazinePdf(int id, String magazineUrl, Magazine magazine) {
		super();
		this.id = id;
		this.magazineUrl = magazineUrl;
		this.magazine = magazine;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMagazineUrl() {
		return magazineUrl;
	}

	public void setMagazineUrl(String magazineUrl) {
		this.magazineUrl = magazineUrl;
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
		MagazinePdf other = (MagazinePdf) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazinePdf [id=").append(id).append(", magazineUrl=").append(magazineUrl).append(", magazine=")
				.append(magazine).append("]");
		return builder.toString();
	}
	
}
