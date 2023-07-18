package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.CollectionStory;

public interface CollectionStoryRepository extends JpaRepository<CollectionStory, Integer> {

}
