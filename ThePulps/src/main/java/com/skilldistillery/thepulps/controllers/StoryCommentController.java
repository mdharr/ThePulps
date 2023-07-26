package com.skilldistillery.thepulps.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.StoryComment;
import com.skilldistillery.thepulps.entities.User;
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
    
    @PostMapping("stories/{sid}/comments")
    public StoryComment create(Principal principal, HttpServletRequest req, HttpServletResponse res, @PathVariable("sid") int storyId, @RequestBody StoryComment storyComment) {
    	
    	try {
    		storyCommentService.createStoryComment(principal.getName(), storyId, storyComment);
    		res.setStatus(201);
    		StringBuffer url = req.getRequestURL();
    		url.append("/").append(storyComment.getId());
    		res.setHeader("Location", url.toString());
    	} catch (Exception e) {
    		e.printStackTrace();
    		res.setStatus(400);
    		storyComment = null;
    	}
    	
    	return storyComment;
    }
    
    @PostMapping("stories/{sid}/comments/{pcid}")
    public StoryComment createReply(Principal principal, HttpServletRequest req, HttpServletResponse res, @PathVariable("sid") int storyId, @PathVariable("pcid") int parentCommentId, @RequestBody StoryComment reply) {
    	
    	try {
    		storyCommentService.createReply(principal.getName(), parentCommentId, reply);
    		res.setStatus(201);
    		StringBuffer url = req.getRequestURL();
    		url.append("/").append(reply.getId());
    		res.setHeader("Location", url.toString());
    	} catch (Exception e) {
    		e.printStackTrace();
    		res.setStatus(400);
    		reply = null;
    	}
    	
    	return reply;
    }
    
    @DeleteMapping("story-comments/{scid}")
    public ResponseEntity<?> deleteStoryComment(Principal principal, HttpServletRequest req, HttpServletResponse res, @PathVariable("scid") int storyCommentId) {
    	String username = principal.getName();
    	
    	if (storyCommentService.deleteStoryComment(username, storyCommentId)) {
    		return ResponseEntity.ok().build();
    	} else {
    		return ResponseEntity.notFound().build();
    	}
    }
	
}
