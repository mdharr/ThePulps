package com.skilldistillery.thepulps.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
public class Author {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "full_name")
	private String fullName;
	
    @ManyToMany
    @JoinTable(name = "story_author",
            joinColumns = @JoinColumn(name = "author_id"),
            inverseJoinColumns = @JoinColumn(name = "story_id"))
    private List<Story> stories;
    
    @ManyToMany
    @JoinTable(name = "author_tag",
            joinColumns = @JoinColumn(name = "author_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private List<Tag> tags;
    
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "author_profile_id")
	private AuthorProfile authorProfile;
    
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;
    
    @Column(name = "image_url")
    private String imageUrl;

	public Author() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Author(int id, String fullName, List<Story> stories, List<Tag> tags, AuthorProfile authorProfile,
			String thumbnailUrl, String imageUrl) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.stories = stories;
		this.tags = tags;
		this.authorProfile = authorProfile;
		this.thumbnailUrl = thumbnailUrl;
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
	}
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public AuthorProfile getAuthorProfile() {
		return authorProfile;
	}

	public void setAuthorProfile(AuthorProfile authorProfile) {
		this.authorProfile = authorProfile;
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
		Author other = (Author) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Author [id=").append(id).append(", fullName=").append(fullName).append("]");
		return builder.toString();
	}
	
}
