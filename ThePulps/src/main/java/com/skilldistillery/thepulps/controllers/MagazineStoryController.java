package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.MagazineStory;
import com.skilldistillery.thepulps.services.MagazineStoryService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineStoryController {
	
	@Autowired
	private MagazineStoryService magazineStoryService;
	
	@GetMapping("magazine-stories")
	public List<MagazineStory> getAllMagazineStories() {
		return magazineStoryService.getAllMagazineStories();
	}

}
