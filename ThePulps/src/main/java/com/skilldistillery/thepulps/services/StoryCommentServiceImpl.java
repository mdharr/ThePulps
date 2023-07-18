package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.StoryComment;
import com.skilldistillery.thepulps.repositories.StoryCommentRepository;

@Service
public class StoryCommentServiceImpl implements StoryCommentService {
	
	@Autowired
	private StoryCommentRepository storyCommentRepo;

	@Override
	public List<StoryComment> getAllStoryComments() {
		return storyCommentRepo.findAll();
	}

}
