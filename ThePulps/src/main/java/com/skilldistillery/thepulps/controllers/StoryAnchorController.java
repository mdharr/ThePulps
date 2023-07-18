package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.StoryAnchor;
import com.skilldistillery.thepulps.services.StoryAnchorService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryAnchorController {
	
	@Autowired
	private StoryAnchorService storyAnchorService;
	
	@GetMapping("story-anchors")
	public List<StoryAnchor> getAllStoryAnchors() {
		return storyAnchorService.getAllStoryAnchors();
	}

}
