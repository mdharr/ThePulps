package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryTag;

public interface StoryTagRepository extends JpaRepository<StoryTag, Integer> {

}
