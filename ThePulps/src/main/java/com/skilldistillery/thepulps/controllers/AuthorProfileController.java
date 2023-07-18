package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.AuthorProfile;
import com.skilldistillery.thepulps.services.AuthorProfileService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class AuthorProfileController {
	
	@Autowired
	private AuthorProfileService authorProfileService;
	
	@GetMapping("author-profiles")
	public List<AuthorProfile> getAllAuthorProfiles() {
		return authorProfileService.getAllAuthorProfiles();
	}

}
