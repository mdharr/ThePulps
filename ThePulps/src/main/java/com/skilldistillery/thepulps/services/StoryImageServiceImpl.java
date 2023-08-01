package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.entities.StoryImage;
import com.skilldistillery.thepulps.repositories.StoryImageRepository;
import com.skilldistillery.thepulps.repositories.StoryRepository;

@Service
public class StoryImageServiceImpl implements StoryImageService {
	
	@Autowired
	private StoryImageRepository storyImageRepo;
	
	@Autowired
	private StoryRepository storyRepo;

	@Override
	public List<StoryImage> getAllStoryImages() {
		return storyImageRepo.findAll();
	}

	@Override
	public List<StoryImage> getAllStoryImagesByStoryId(int storyId) {
		Optional<Story> storyOptional = storyRepo.findById(storyId);
		if(storyOptional.isPresent()) {
			Story story = storyOptional.get();
			List<StoryImage> storyImages = story.getStoryImages();
			return storyImages;
		}
		return null;
	}

}
