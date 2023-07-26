package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.StoryComment;

public interface StoryCommentService {
	
	public List<StoryComment> getAllStoryComments();

	public List<StoryComment> getAllStoryCommentsByStoryId(int storyId);
	
    StoryComment createStoryComment(String username, int storyId, StoryComment storyComment);
    
    StoryComment createReply(String username, int parentCommentId, StoryComment reply);

}
