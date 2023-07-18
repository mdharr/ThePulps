package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.UserConversation;

public interface UserConversationRepository extends JpaRepository<UserConversation, Integer> {

}
