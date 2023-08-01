package com.skilldistillery.thepulps.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.services.StoryImageService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryImageController {
	
	@Autowired
	private StoryImageService storyImageService;

}
