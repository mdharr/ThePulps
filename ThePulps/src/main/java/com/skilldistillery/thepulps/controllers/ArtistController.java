package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Artist;
import com.skilldistillery.thepulps.services.ArtistService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class ArtistController {
	
	@Autowired
	private ArtistService artistService;
	
	@GetMapping("artists")
	public List<Artist> getAllArtists() {
		return artistService.getAllArtists();
	}

}
