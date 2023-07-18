package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.StoryMember;

public interface StoryMemberRepository extends JpaRepository<StoryMember, Integer> {

}
