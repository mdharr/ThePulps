package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Story;

public interface StoryService {
	
//	public Publication createPublication(Publication publication);

    public Story getStoryById(int storyId);

    public List<Story> getAllStories();

//    public Publication updatePublication(int publicationId, Publication publication);

//    public boolean deletePublication(int publicationId);

}
