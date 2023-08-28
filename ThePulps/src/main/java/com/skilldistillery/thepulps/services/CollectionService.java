package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Collection;

public interface CollectionService {
	
	public List<Collection> getAllCollections();
	
//	public List<Collection> getByUserId(int userId);
	
	public List<Collection> getByUser(String username);
	
    Collection createCollection(String username, Collection collection);
    
    boolean deleteCollection(String username, Integer collectionId);

    Collection addStoryToCollection(String username, Integer collectionId, Integer storyId);

    Collection removeStoryFromCollection(String username, Integer collectionId, int storyId);

}
