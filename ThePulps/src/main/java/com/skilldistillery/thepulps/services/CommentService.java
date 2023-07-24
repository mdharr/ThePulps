package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Comment;

public interface CommentService {
	
	List<Comment> getAllComments();
	
	List<Comment> getAllCommentsByPostId(int postId);

}
