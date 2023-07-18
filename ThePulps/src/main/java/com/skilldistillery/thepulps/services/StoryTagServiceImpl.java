package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.StoryTag;
import com.skilldistillery.thepulps.repositories.StoryTagRepository;

@Service
public class StoryTagServiceImpl implements StoryTagService {
	
	@Autowired
	private StoryTagRepository storyTagRepo;

	@Override
	public List<StoryTag> getAllStoryTags() {
		return storyTagRepo.findAll();
	}

}
