package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.StoryAnchor;
import com.skilldistillery.thepulps.repositories.StoryAnchorRepository;

@Service
public class StoryAnchorServiceImpl implements StoryAnchorService {
	
	@Autowired
	private StoryAnchorRepository storyAnchorRepo;

	@Override
	public List<StoryAnchor> getAllStoryAnchors() {
		return storyAnchorRepo.findAll();
	}

}
