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
import javax.persistence.OrderBy;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Story {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@OneToMany(mappedBy = "story")
	private List<StoryPdf> storyPdfs;
	
    @ManyToMany
    @JoinTable(name = "story_author",
            joinColumns = @JoinColumn(name = "story_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id"))
    private List<Author> authors;
    
    @ManyToMany
    @JoinTable(name = "story_tag",
            joinColumns = @JoinColumn(name = "story_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private List<Tag> tags;
    
    @ManyToMany
    @JoinTable(name = "magazine_story",
            joinColumns = @JoinColumn(name = "story_id"),
            inverseJoinColumns = @JoinColumn(name = "magazine_id"))
    private List<Magazine> magazines;
    
    @ManyToMany
    @JoinTable(name = "collection_story",
    joinColumns = @JoinColumn(name = "story_id"),
    inverseJoinColumns = @JoinColumn(name = "collection_id"))
    private List<Collection> collections;
    
    @ManyToMany
    @JoinTable(name = "story_member",
            joinColumns = @JoinColumn(name = "story_id"),
            inverseJoinColumns = @JoinColumn(name = "member_id"))
    private List<Member> members;
    
	@OneToMany(mappedBy = "story")
	@OrderBy("createdAt ASC") // ordering storyComments by their createdAt column
	private List<StoryComment> storyComments;
	
	@Column(name = "thumbnail_url")
	private String thumbnailUrl;
	
	@Column(name = "background_url")
	private String backgroundUrl;
	
    @ManyToMany
    @JoinTable(name = "story_anchor",
            joinColumns = @JoinColumn(name = "story_id"),
            inverseJoinColumns = @JoinColumn(name = "magazine_html_id"))
    private List<MagazineHtml> htmlMagazines;

	public Story() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Story(int id, String title, LocalDateTime createdAt, List<StoryPdf> storyPdfs, List<Author> authors,
			List<Tag> tags, List<Magazine> magazines, List<Collection> collections, List<Member> members,
			List<StoryComment> storyComments, String thumbnailUrl, String backgroundUrl, List<MagazineHtml> htmlMagazines) {
		super();
		this.id = id;
		this.title = title;
		this.createdAt = createdAt;
		this.storyPdfs = storyPdfs;
		this.authors = authors;
		this.tags = tags;
		this.magazines = magazines;
		this.collections = collections;
		this.members = members;
		this.storyComments = storyComments;
		this.thumbnailUrl = thumbnailUrl;
		this.backgroundUrl = backgroundUrl;
		this.htmlMagazines = htmlMagazines;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public List<StoryPdf> getStoryPdfs() {
		return storyPdfs;
	}

	public void setStoryPdfs(List<StoryPdf> storyPdfs) {
		this.storyPdfs = storyPdfs;
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Magazine> getMagazines() {
		return magazines;
	}

	public void setMagazines(List<Magazine> magazines) {
		this.magazines = magazines;
	}

	public List<Collection> getCollections() {
		return collections;
	}

	public void setCollections(List<Collection> collections) {
		this.collections = collections;
	}

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public List<StoryComment> getStoryComments() {
		return storyComments;
	}

	public void setStoryComments(List<StoryComment> storyComments) {
		this.storyComments = storyComments;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getBackgroundUrl() {
		return backgroundUrl;
	}

	public void setBackgroundUrl(String backgroundUrl) {
		this.backgroundUrl = backgroundUrl;
	}

	public List<MagazineHtml> getHtmlMagazines() {
		return htmlMagazines;
	}

	public void setHtmlMagazines(List<MagazineHtml> htmlMagazines) {
		this.htmlMagazines = htmlMagazines;
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
		Story other = (Story) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Story [id=").append(id).append(", title=").append(title).append(", createdAt=")
				.append(createdAt).append(", storyPdfs=").append(storyPdfs).append("]");
		return builder.toString();
	}
	
}
