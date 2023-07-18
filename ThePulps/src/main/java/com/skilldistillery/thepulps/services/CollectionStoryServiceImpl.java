package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.CollectionStory;
import com.skilldistillery.thepulps.repositories.CollectionStoryRepository;

@Service
public class CollectionStoryServiceImpl implements CollectionStoryService {
	
	@Autowired
	private CollectionStoryRepository collectionStoryRepo;

	@Override
	public List<CollectionStory> getAllCollectionStories() {
		return collectionStoryRepo.findAll();
	}

}
