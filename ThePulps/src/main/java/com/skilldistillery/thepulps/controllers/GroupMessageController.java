package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.GroupMessage;
import com.skilldistillery.thepulps.services.GroupMessageService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class GroupMessageController {
	
	@Autowired
	private GroupMessageService groupMessageService;
	
	@GetMapping("group-messages")
	public List<GroupMessage> getAllGroupMessages() {
		return groupMessageService.getAllGroupMessages();
	}

}
