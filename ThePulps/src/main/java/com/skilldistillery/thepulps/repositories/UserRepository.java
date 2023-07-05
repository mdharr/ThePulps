package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	User findByUsername(String username);

}
