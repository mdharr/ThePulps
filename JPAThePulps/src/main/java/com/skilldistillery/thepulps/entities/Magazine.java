package com.skilldistillery.thepulps.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Magazine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@Column(name = "cover_artwork_id") // REPLACE AFTER CREATING COVER_ARTWORK ENTITY!!!
	private int coverArtworkId;
	
	@ManyToOne
	@Column(name = "publication_id")
	private Publication publication;
	
	private String name;
	
	@Column(name = "released_at")
	private String releasedAt;

}
