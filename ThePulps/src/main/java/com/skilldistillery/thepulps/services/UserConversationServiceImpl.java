package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.UserConversation;
import com.skilldistillery.thepulps.repositories.UserConversationRepository;

@Service
public class UserConversationServiceImpl implements UserConversationService {
	
	@Autowired
	private UserConversationRepository userConversationRepo;

	@Override
	public List<UserConversation> getAllUserConversations() {
		return userConversationRepo.findAll();
	}

}
