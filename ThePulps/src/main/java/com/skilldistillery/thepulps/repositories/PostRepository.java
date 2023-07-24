package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {

}
