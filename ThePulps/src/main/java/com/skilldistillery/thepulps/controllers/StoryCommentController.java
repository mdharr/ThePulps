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
	
    @GetMapping("stories/{sid}/comments")
    public List<StoryComment> getAllStoryCommentsByStoryId(@PathVariable("sid") int storyId, HttpServletRequest req, HttpServletResponse res) {
    	return storyCommentService.getAllStoryCommentsByStoryId(storyId);
    }
	
}
