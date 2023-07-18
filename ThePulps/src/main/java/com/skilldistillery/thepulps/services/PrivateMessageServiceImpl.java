package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.PrivateMessage;
import com.skilldistillery.thepulps.repositories.PrivateMessageRepository;

@Service
public class PrivateMessageServiceImpl implements PrivateMessageService {
	
	@Autowired
	private PrivateMessageRepository privateMessageRepo;

	@Override
	public List<PrivateMessage> getAllPrivateMessages() {
		return privateMessageRepo.findAll();
	}

}
