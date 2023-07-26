package com.skilldistillery.thepulps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryComment;

public interface StoryCommentRepository extends JpaRepository<StoryComment, Integer> {
	
	List<StoryComment> findByStory_Id(int storyId);

}
