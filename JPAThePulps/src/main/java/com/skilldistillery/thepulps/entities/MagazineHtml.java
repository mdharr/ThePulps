package com.skilldistillery.thepulps.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "magazine_html")
public class MagazineHtml {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "file_url")
	private String fileUrl;
	
    @OneToOne(mappedBy = "magazineHtml")
    private Magazine magazine;
    
    @ManyToMany
    @JoinTable(name = "story_anchor",
            joinColumns = @JoinColumn(name = "magazine_html_id"),
            inverseJoinColumns = @JoinColumn(name = "story_id"))
    private List<Story> stories;

	public MagazineHtml() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazineHtml(int id, String fileUrl, Magazine magazine, List<Story> stories) {
		super();
		this.id = id;
		this.fileUrl = fileUrl;
		this.magazine = magazine;
		this.stories = stories;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public Magazine getMagazine() {
		return magazine;
	}

	public void setMagazine(Magazine magazine) {
		this.magazine = magazine;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
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
		MagazineHtml other = (MagazineHtml) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MagazineHtml [id=").append(id).append(", fileUrl=").append(fileUrl).append("]");
		return builder.toString();
	}

}
