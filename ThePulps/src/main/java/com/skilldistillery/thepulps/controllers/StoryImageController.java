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

import com.skilldistillery.thepulps.entities.StoryImage;
import com.skilldistillery.thepulps.services.StoryImageService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryImageController {
	
	@Autowired
	private StoryImageService storyImageService;
	
	@GetMapping("story-images")
	public List<StoryImage> getAllStoryImages() {
		return storyImageService.getAllStoryImages();
	}
	
	@GetMapping("stories/{sid}/story-images")
	public List<StoryImage> getAllStoryImagesByStoryId(@PathVariable("sid") int storyId, HttpServletRequest req, HttpServletResponse res) {
		return storyImageService.getAllStoryImagesByStoryId(storyId);
	}

}
