package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Comment;
import com.skilldistillery.thepulps.repositories.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentRepository commentRepo;

	@Override
	public List<Comment> getAllComments() {
		return commentRepo.findAll();
	}

	@Override
	public List<Comment> getAllCommentsByPostId(int postId) {
		return commentRepo.findByPost_Id(postId);
	}

}
