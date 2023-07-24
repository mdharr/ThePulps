package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Post;
import com.skilldistillery.thepulps.repositories.PostRepository;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostRepository postRepo;

	@Override
	public List<Post> getAllPosts() {
		return postRepo.findAll();
	}

	@Override
	public Set<Post> indexByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post show(String username, int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post create(String username, Post post, int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post update(String username, int postId, Post post, int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean archive(String username, int postId, int categoryId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Post updateViewCount(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean pinPost(int postId, int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> findByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
