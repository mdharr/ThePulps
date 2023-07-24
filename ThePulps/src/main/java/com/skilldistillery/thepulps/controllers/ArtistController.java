package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Artist;
import com.skilldistillery.thepulps.entities.Magazine;
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
	
	@GetMapping("artists/{aid}/magazines")
	public List<Magazine> getAllMagazinesByArtistId(@PathVariable("aid") int artistId, HttpServletRequest req, HttpServletResponse res) {
		return artistService.getAllMagazinesByArtistId(artistId);
	}

}
