package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.GroupMessage;

public interface GroupMessageRepository extends JpaRepository<GroupMessage, Integer> {

}
