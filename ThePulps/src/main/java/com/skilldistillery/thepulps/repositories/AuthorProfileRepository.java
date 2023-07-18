package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.AuthorProfile;

public interface AuthorProfileRepository extends JpaRepository<AuthorProfile, Integer> {

}
