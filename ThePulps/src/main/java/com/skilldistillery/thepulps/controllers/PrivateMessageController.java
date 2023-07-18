package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.PrivateMessage;
import com.skilldistillery.thepulps.services.PrivateMessageService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class PrivateMessageController {
	
	@Autowired
	private PrivateMessageService privateMessageService;
	
	@GetMapping("private-messages")
	public List<PrivateMessage> getAllPrivateMessages() {
		return privateMessageService.getAllPrivateMessages();
	}

}
