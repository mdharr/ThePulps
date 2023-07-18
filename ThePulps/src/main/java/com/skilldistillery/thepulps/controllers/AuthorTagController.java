package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.AuthorTag;
import com.skilldistillery.thepulps.services.AuthorTagService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class AuthorTagController {
	
	@Autowired
	private AuthorTagService authorTagService;
	
	@GetMapping("author-tags")
	public List<AuthorTag> getAllAuthorTags() {
		return authorTagService.getAllAuthorTags();
	}

}
