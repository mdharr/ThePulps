package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.StoryComment;
import com.skilldistillery.thepulps.services.StoryCommentService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryCommentController {
	
	@Autowired
	private StoryCommentService storyCommentService;
	
	@GetMapping("story-comments")
	public List<StoryComment> getAllStoryComments() {
		return storyCommentService.getAllStoryComments();
	}

}
