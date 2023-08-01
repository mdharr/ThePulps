package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryImage;

public interface StoryImageRepository extends JpaRepository<StoryImage, Integer> {

}
