package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Artist;
import com.skilldistillery.thepulps.entities.Magazine;

public interface ArtistService {
	
	List<Artist> getAllArtists();
	
	List<Magazine> getAllMagazinesByArtistId(int artistId);
	
}
