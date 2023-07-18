package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {

}
