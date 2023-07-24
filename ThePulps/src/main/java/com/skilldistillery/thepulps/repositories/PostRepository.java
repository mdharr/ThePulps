package com.skilldistillery.thepulps.repositories;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {
	
	Set<Post> findByUser_Username(String username);
	
	Post findByIdAndUserId(int postId, int userId);

	Post findByUser_UsernameAndId(String username, int postId);
	
	List<Post> findByUser_Id(int userId);

}
