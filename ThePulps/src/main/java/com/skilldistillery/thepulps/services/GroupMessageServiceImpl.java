package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.GroupMessage;
import com.skilldistillery.thepulps.repositories.GroupMessageRepository;

@Service
public class GroupMessageServiceImpl implements GroupMessageService {
	
	@Autowired
	private GroupMessageRepository groupMessageRepo;

	@Override
	public List<GroupMessage> getAllGroupMessages() {
		return groupMessageRepo.findAll();
	}

}
