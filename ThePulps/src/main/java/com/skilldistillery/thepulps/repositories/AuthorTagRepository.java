package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.AuthorTag;

public interface AuthorTagRepository extends JpaRepository<AuthorTag, Integer> {

}
