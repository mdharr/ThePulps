package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.entities.StoryComment;
import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.repositories.StoryCommentRepository;
import com.skilldistillery.thepulps.repositories.StoryRepository;
import com.skilldistillery.thepulps.repositories.UserRepository;

@Service
public class StoryCommentServiceImpl implements StoryCommentService {
	
	@Autowired
	private StoryCommentRepository storyCommentRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private StoryRepository storyRepo;

	@Override
	public List<StoryComment> getAllStoryComments() {
		return storyCommentRepo.findAll();
	}

	@Override
	public List<StoryComment> getAllStoryCommentsByStoryId(int storyId) {
		return storyCommentRepo.findByStory_Id(storyId);
	}

//	@Override
//	public StoryComment createStoryComment(String username, int storyId, StoryComment storyComment) {
//	    User user = userRepo.findByUsername(username);
//	    Optional<Story> storyOptional = storyRepo.findById(storyId);
//
//	    if (user != null && storyOptional.isPresent()) {
//	        Story story = storyOptional.get();
//	        storyComment.setUser(user);
//	        storyComment.setStory(story);
//	        return storyCommentRepo.saveAndFlush(storyComment);
//	    }
//
//	    return null;
//	}
	
//	@Override
//	public StoryComment createStoryComment(String username, int storyId, StoryComment storyComment) {
//	    User user = userRepo.findByUsername(username);
//	    Optional<Story> storyOptional = storyRepo.findById(storyId);
//
//	    if (user != null && storyOptional.isPresent()) {
//	        Story story = storyOptional.get();
//	        storyComment.setUser(user);
//	        storyComment.setStory(story);
//
//	        if (storyComment.getParentComment() != null) {
//	            int parentCommentId = storyComment.getParentComment().getId();
//	            Optional<StoryComment> parentCommentOptional = storyCommentRepo.findById(parentCommentId);
//	            if (parentCommentOptional.isPresent()) {
//	                storyComment.setParentComment(parentCommentOptional.get());
//	            } else {
//	            	throw new EntityNotFoundException("Parent comment not found");
//	            }
//	        }
//
//	        return storyCommentRepo.saveAndFlush(storyComment);
//	    }
//
//	    return null;
//	}
	
	@Override
	public StoryComment createStoryComment(String username, int storyId, StoryComment storyComment) {
	    User user = userRepo.findByUsername(username);
	    Optional<Story> storyOptional = storyRepo.findById(storyId);
	    if (storyOptional.isPresent() && user != null) {
	    	Story story = storyOptional.get();
	    	storyComment.setUser(user);
	    	storyComment.setStory(story);
	    	return storyCommentRepo.saveAndFlush(storyComment);
	    }

	    return null;
	}
	
	

	@Override
	public StoryComment createReply(String username, int parentCommentId, StoryComment reply) {
	    User user = userRepo.findByUsername(username);
	    Optional<StoryComment> parentCommentOptional = storyCommentRepo.findById(parentCommentId);

	    if (user != null && parentCommentOptional.isPresent()) {
	        StoryComment parentComment = parentCommentOptional.get();
	        reply.setUser(user);
	        reply.setStory(parentComment.getStory());
	        reply.setParentComment(parentComment);

	        return storyCommentRepo.saveAndFlush(reply);
	    }

	    return null;
	}


}
