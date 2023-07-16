package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Story;

public interface StoryRepository extends JpaRepository<Story, Integer> {

}
