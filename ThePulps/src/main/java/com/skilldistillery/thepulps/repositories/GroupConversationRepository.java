package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.GroupConversation;

public interface GroupConversationRepository extends JpaRepository<GroupConversation, Integer> {

}
