package com.skilldistillery.thepulps.services;

import java.security.Principal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Collection;
import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.repositories.CollectionRepository;
import com.skilldistillery.thepulps.repositories.StoryRepository;
import com.skilldistillery.thepulps.repositories.UserRepository;

@Service
public class CollectionServiceImpl implements CollectionService {
	
	@Autowired
	private CollectionRepository collectionRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private StoryRepository storyRepo;

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

    @Override
    public Collection createCollection(String username, Collection collection) {
    	User user = userRepo.findByUsername(username);
    	if(user != null) {
    		collection.setUser(user);
    		return collectionRepo.save(collection);
    	}

        return null; // User does not have permission to create this collection
    }
    
    @Override
    public boolean deleteCollection(String username, Integer collectionId) {
        // First, check if the collection exists and belongs to the user.
        Collection collection = collectionRepo.findByIdAndUser_Username(collectionId, username);

        if (collection != null) {
            collectionRepo.delete(collection);
            return true; // Collection successfully deleted
        }

        return false; // Collection not found or doesn't belong to the user
    }

    @Override
    public Collection addStoryToCollection(String username, Integer collectionId, Integer storyId) {
        Collection collection = collectionRepo.findByIdAndUser_Username(collectionId, username);
        Story story = storyRepo.findById(storyId).orElse(null);

        if (collection != null && story != null) {
            collection.getStories().add(story);
            return collectionRepo.save(collection);
        }

        return null; // Collection or Story not found
    }

    @Override
    public Collection removeStoryFromCollection(String username, Integer collectionId, int storyId) {
        Collection collection = collectionRepo.findByIdAndUser_Username(collectionId, username);

        if (collection != null) {
            List<Story> stories = collection.getStories();
            stories.removeIf(story -> Integer.valueOf(story.getId()).equals(storyId));
            collection.setStories(stories); // Update the stories in the collection
            return collectionRepo.save(collection);
        }

        return null; // Collection not found
    }

}
