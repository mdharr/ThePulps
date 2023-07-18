package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.StoryMember;
import com.skilldistillery.thepulps.services.StoryMemberService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryMemberController {
	
	@Autowired
	private StoryMemberService storyMemberService;
	
	@GetMapping("story-members")
	public List<StoryMember> getAllStoryMembers() {
		return storyMemberService.getAllStoryMembers();
	}

}
