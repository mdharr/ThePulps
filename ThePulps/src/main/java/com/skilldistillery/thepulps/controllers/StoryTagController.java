package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.StoryTag;
import com.skilldistillery.thepulps.services.StoryTagService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryTagController {
	
	@Autowired
	private StoryTagService storyTagService;
	
	@GetMapping("story-tags")
	public List<StoryTag> getAllStoryTags() {
		return storyTagService.getAllStoryTags();
	}

}
