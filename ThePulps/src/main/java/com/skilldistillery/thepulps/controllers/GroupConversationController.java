package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.GroupConversation;
import com.skilldistillery.thepulps.services.GroupConversationService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class GroupConversationController {
	
	@Autowired
	private GroupConversationService groupConversationService;
	
	@GetMapping("group-conversations")
	public List<GroupConversation> getAllGroupConversations() {
		return groupConversationService.getAllGroupConversations();
	}

}
