package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.CollectionStory;
import com.skilldistillery.thepulps.services.CollectionStoryService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class CollectionStoryController {
	
	@Autowired
	private CollectionStoryService collectionStoryService;
	
	@GetMapping("collection-stories")
	public List<CollectionStory> getAllCollectionStories() {
		return collectionStoryService.getAllCollectionStories();
	}

}
