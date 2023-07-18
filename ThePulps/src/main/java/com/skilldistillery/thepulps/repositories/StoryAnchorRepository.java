package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryAnchor;

public interface StoryAnchorRepository extends JpaRepository<StoryAnchor, Integer> {

}
