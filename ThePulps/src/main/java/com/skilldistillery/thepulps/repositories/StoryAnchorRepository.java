package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.MagazineHtml;
import com.skilldistillery.thepulps.entities.StoryAnchor;

public interface StoryAnchorRepository extends JpaRepository<StoryAnchor, Integer> {
	
	StoryAnchor findByStoryIdAndMagazineHtml(int storyId, MagazineHtml magazineHtml);

}
