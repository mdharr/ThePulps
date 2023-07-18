package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.UserConversation;
import com.skilldistillery.thepulps.services.UserConversationService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class UserConversationController {
	
	@Autowired
	private UserConversationService userConversationService;
	
	@GetMapping("user-conversations")
	public List<UserConversation> getAllUserConversations() {
		return userConversationService.getAllUserConversations();
	}

}
