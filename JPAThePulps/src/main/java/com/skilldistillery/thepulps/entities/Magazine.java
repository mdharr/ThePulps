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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Magazine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "cover_artwork_id")
	private CoverArtwork coverArtwork;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "publication_id")
	private Publication publication;
	
	private String name;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@JsonIgnore
    @ManyToMany
    @JoinTable(name = "magazine_tag",
            joinColumns = @JoinColumn(name = "magazine_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private List<Tag> tags;
    
    @JsonIgnore
    @ManyToMany
    @JoinTable(name = "magazine_story",
            joinColumns = @JoinColumn(name = "magazine_id"),
            inverseJoinColumns = @JoinColumn(name = "story_id"))
    private List<Story> stories;
    
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;
    
    @Column(name = "image_url")
    private String imageUrl;
    
    @JsonIgnore
	@OneToMany(mappedBy = "magazine")
	private List<MagazinePdf> magazinePdfs;
	
//    @JsonIgnore
	@OneToOne
	@JoinColumn(name = "magazine_html_id")
	private MagazineHtml magazineHtml;
    
	@ManyToOne
	@JoinColumn(name = "magazine_editor_id")
	private MagazineEditor magazineEditor;
	
	@Column(name = "table_of_contents")
	private String tableOfContents;

	public Magazine() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Magazine(int id, CoverArtwork coverArtwork, Publication publication, String name, LocalDateTime createdAt,
			List<Tag> tags, List<Story> stories, String thumbnailUrl, String imageUrl, List<MagazinePdf> magazinePdfs, 
			MagazineHtml magazineHtml, MagazineEditor magazineEditor, String tableOfContents) {
		super();
		this.id = id;
		this.coverArtwork = coverArtwork;
		this.publication = publication;
		this.name = name;
		this.createdAt = createdAt;
		this.tags = tags;
		this.stories = stories;
		this.thumbnailUrl = thumbnailUrl;
		this.imageUrl = imageUrl;
		this.magazinePdfs = magazinePdfs;
		this.magazineHtml = magazineHtml;
		this.magazineEditor = magazineEditor;
		this.tableOfContents = tableOfContents;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public CoverArtwork getCoverArtwork() {
		return coverArtwork;
	}

	public void setCoverArtwork(CoverArtwork coverArtwork) {
		this.coverArtwork = coverArtwork;
	}

	public Publication getPublication() {
		return publication;
	}

	public void setPublication(Publication publication) {
		this.publication = publication;
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

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
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

	public List<MagazinePdf> getMagazinePdfs() {
		return magazinePdfs;
	}

	public void setMagazinePdfs(List<MagazinePdf> magazinePdfs) {
		this.magazinePdfs = magazinePdfs;
	}

	public MagazineHtml getMagazineHtml() {
		return magazineHtml;
	}

	public void setMagazineHtml(MagazineHtml magazineHtml) {
		this.magazineHtml = magazineHtml;
	}

	public MagazineEditor getMagazineEditor() {
		return magazineEditor;
	}

	public void setMagazineEditor(MagazineEditor magazineEditor) {
		this.magazineEditor = magazineEditor;
	}

	public String getTableOfContents() {
		return tableOfContents;
	}

	public void setTableOfContents(String tableOfContents) {
		this.tableOfContents = tableOfContents;
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
		Magazine other = (Magazine) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Magazine [id=").append(id).append(", coverArtwork=").append(coverArtwork)
				.append(", publication=").append(publication).append(", name=").append(name).append(", createdAt=")
				.append(createdAt).append("]");
		return builder.toString();
	}
	
}
