package com.skilldistillery.thepulps.repositories;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	Set<Comment> findByUser_Username(String username);
	
	Comment findByIdAndUserId(int commentId, int userId);
	
	List<Comment> findByPost_Id(int postId);
	
	List<Comment> findByUser_Id(int userId);
	
//	Post findPostByPostId(int postId);

}
