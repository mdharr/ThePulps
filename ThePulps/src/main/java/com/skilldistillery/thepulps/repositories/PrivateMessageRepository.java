package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.PrivateMessage;

public interface PrivateMessageRepository extends JpaRepository<PrivateMessage, Integer> {

}
