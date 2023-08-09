package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
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
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Publication {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
//	@JsonIgnore
	@OneToMany(mappedBy = "publication")
	private List<Magazine> magazines;
	
	@JsonIgnore
    @ManyToMany
    @JoinTable(name = "publication_tag",
            joinColumns = @JoinColumn(name = "publication_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private List<Tag> tags;
    
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;
    
    @Column(name = "image_url")
    private String imageUrl;
    
    private String description;

	public Publication() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Publication(int id, String name, LocalDateTime createdAt, List<Magazine> magazines, List<Tag> tags,
			String thumbnailUrl, String imageUrl, String description) {
		super();
		this.id = id;
		this.name = name;
		this.createdAt = createdAt;
		this.magazines = magazines;
		this.tags = tags;
		this.thumbnailUrl = thumbnailUrl;
		this.imageUrl = imageUrl;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public List<Magazine> getMagazines() {
		return magazines;
	}

	public void setMagazines(List<Magazine> magazines) {
		this.magazines = magazines;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		Publication other = (Publication) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Publication [id=").append(id).append(", name=").append(name).append(", createdAt=")
				.append(createdAt).append("]");
		return builder.toString();
	}
	
}
