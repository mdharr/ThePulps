package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.thepulps.entities.Artist;
import com.skilldistillery.thepulps.repositories.ArtistRepository;

public class ArtistServiceImpl implements ArtistService {
	
	@Autowired
	private ArtistRepository artistRepo;

	@Override
	public List<Artist> getAllArtists() {
		return artistRepo.findAll();
	}

}
