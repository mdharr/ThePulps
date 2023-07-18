package com.skilldistillery.thepulps.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.skilldistillery.thepulps.enums.Genre;

@Entity
public class Tag {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Enumerated(EnumType.STRING)
	private Genre genre = Genre.NOT_SPECIFIED;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "author_tag",
	        joinColumns = @JoinColumn(name = "tag_id"),
	        inverseJoinColumns = @JoinColumn(name = "author_id"))
	private List<Author> authors;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "story_tag",
		joinColumns = @JoinColumn(name = "tag_id"),
		inverseJoinColumns = @JoinColumn(name = "story_id"))
	private List<Story> stories;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "magazine_tag",
	joinColumns = @JoinColumn(name = "tag_id"),
	inverseJoinColumns = @JoinColumn(name = "magazine_id"))
	private List<Magazine> magazines;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "publication_tag",
	joinColumns = @JoinColumn(name = "tag_id"),
	inverseJoinColumns = @JoinColumn(name = "publication_id"))
	private List<Publication> publications;

	public Tag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tag(int id, Genre genre, List<Author> authors, List<Story> stories, List<Magazine> magazines, List<Publication> publications) {
		super();
		this.id = id;
		this.genre = genre;
		this.stories = stories;
		this.magazines = magazines;
		this.publications = publications;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
	}

	public List<Magazine> getMagazines() {
		return magazines;
	}

	public void setMagazines(List<Magazine> magazines) {
		this.magazines = magazines;
	}

	public List<Publication> getPublications() {
		return publications;
	}

	public void setPublications(List<Publication> publications) {
		this.publications = publications;
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
		Tag other = (Tag) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Tag [id=").append(id).append(", genre=").append(genre).append("]");
		return builder.toString();
	}
	
}
