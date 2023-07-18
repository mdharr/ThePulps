package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryAuthor;

public interface StoryAuthorRepository extends JpaRepository<StoryAuthor, Integer> {

}
