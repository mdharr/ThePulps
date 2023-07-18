package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.UserProfile;
import com.skilldistillery.thepulps.services.UserProfileService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class UserProfileController {
	
	@Autowired
	private UserProfileService userProfileService;

	@GetMapping("user-profiles")
	public List<UserProfile> getAllUserProfiles() {
		return userProfileService.getAllUserProfiles();
	}
}
