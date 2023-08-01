package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.StoryImage;

public interface StoryImageService {
	
	List<StoryImage> getAllStoryImages();
	
	List<StoryImage> getAllStoryImagesByStoryId(int storyId);

}
