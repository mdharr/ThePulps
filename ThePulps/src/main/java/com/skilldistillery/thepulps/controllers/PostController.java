package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Post;
import com.skilldistillery.thepulps.services.PostService;

@CrossOrigin({ "*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@GetMapping("posts")
	public List<Post> getAllPosts() {
		return postService.getAllPosts();
	}

}
