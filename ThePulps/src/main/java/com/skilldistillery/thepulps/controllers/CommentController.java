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

import com.skilldistillery.thepulps.entities.Comment;
import com.skilldistillery.thepulps.services.CommentService;

@CrossOrigin({ "*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@GetMapping("comments")
	public List<Comment> getAllComments(HttpServletRequest req, HttpServletResponse res) {
		return commentService.getAllComments();
	}
	
	@GetMapping("posts/{pid}/comments")
	public List<Comment> getAllCommentsByPostId(@PathVariable("pid") int postId, HttpServletRequest req, HttpServletResponse res) {
		return commentService.getAllCommentsByPostId(postId);
	}

}
