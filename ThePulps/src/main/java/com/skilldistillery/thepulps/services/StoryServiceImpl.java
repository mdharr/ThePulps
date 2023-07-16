package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.repositories.StoryRepository;

@Service
public class StoryServiceImpl implements StoryService {
	
	@Autowired
	private StoryRepository storyRepo;

	@Override
	public List<Story> getAllStories() {
		return storyRepo.findAll();
	}

}
