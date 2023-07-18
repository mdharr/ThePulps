package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.GroupConversation;
import com.skilldistillery.thepulps.repositories.GroupConversationRepository;

@Service
public class GroupConversationServiceImpl implements GroupConversationService {
	
	@Autowired
	private GroupConversationRepository groupConversationRepo;

	@Override
	public List<GroupConversation> getAllGroupConversations() {
		return groupConversationRepo.findAll();
	}

}
