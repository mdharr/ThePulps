package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryComment;

public interface StoryCommentRepository extends JpaRepository<StoryComment, Integer> {

}
