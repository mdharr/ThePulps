package com.skilldistillery.thepulps.services;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Collection;
import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.repositories.CollectionRepository;
import com.skilldistillery.thepulps.repositories.UserRepository;

@Service
public class CollectionServiceImpl implements CollectionService {
	
	@Autowired
	private CollectionRepository collectionRepo;
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public List<Collection> getAllCollections() {
		return collectionRepo.findAll();
	}

	@Override
	public List<Collection> getByUserId(int userId) {
		Optional<User> userOptional = userRepo.findById(userId);
		if(userOptional.isPresent()) {
			User user = userOptional.get();
			return collectionRepo.findByUserId(userId);
		}
		return Collections.emptyList();
	}

}
