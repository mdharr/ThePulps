package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.StoryAuthor;
import com.skilldistillery.thepulps.repositories.StoryAuthorRepository;

@Service
public class StoryAuthorServiceImpl implements StoryAuthorService {
	
	@Autowired
	private StoryAuthorRepository storyAuthorRepo;

	@Override
	public List<StoryAuthor> getAllStoryAuthors() {
		return storyAuthorRepo.findAll();
	}

}
