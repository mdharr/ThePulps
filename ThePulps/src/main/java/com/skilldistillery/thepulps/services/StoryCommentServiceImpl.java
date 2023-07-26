package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Collection;
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
	
	@Override
	public StoryComment createStoryComment(String username, int storyId, StoryComment storyComment) {
	    User user = userRepo.findByUsername(username);
	    Optional<Story> storyOptional = storyRepo.findById(storyId);
	    if (storyOptional.isPresent() && user != null) {
	    	Story story = storyOptional.get();
	    	storyComment.setUser(user);
	    	storyComment.setStory(story);
	    	storyComment.setDeleted(false);
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

//	@Override
//	public boolean deleteStoryComment(String username, Integer storyCommentId) {
//		StoryComment storyComment = storyCommentRepo.findByIdAndUser_Username(storyCommentId, username);
//		
//		if (storyComment != null) {
//			storyCommentRepo.delete(storyComment);
//			return true;
//		}
//		
//		return false;
//	}
	
	@Override
	public boolean deleteStoryComment(String username, Integer storyCommentId) {
	    StoryComment storyComment = storyCommentRepo.findByIdAndUser_Username(storyCommentId, username);

	    if (storyComment != null) {
	        if (storyComment.getParentComment() != null) {
	            // Remove the parent comment association from the replies
	            List<StoryComment> replies = storyComment.getReplies();
	            if (replies != null && !replies.isEmpty()) {
	                for (StoryComment reply : replies) {
	                    reply.setParentComment(null);
	                }
	            }
	        }
	        
	        // Update the content to indicate that the comment has been deleted
	        storyComment.setContent("This user has deleted their comment");
	        
	        // Set a flag indicating that the comment has been deleted
	        storyComment.setDeleted(true);

	        storyCommentRepo.saveAndFlush(storyComment);
	        return true;
	    }

	    return false;
	}


}
