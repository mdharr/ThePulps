package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Set;

import com.skilldistillery.thepulps.entities.Post;

public interface PostService {
	
	public List<Post> index(int categoryId);
	
	public Set<Post> indexByUsername(String username);
	
	public Post show(String username, int postId);
	
	public Post create(String username, Post post, int categoryId);
	
	public Post update(String username, int postId, Post post, int categoryId);
	
	public boolean archive(String username, int postId, int categoryId);
	
	public Post updateViewCount(int postId);
	
	public Boolean pinPost(int postId, int categoryId);
	
	public List<Post> findByUserId(int userId);

}
