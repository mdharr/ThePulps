package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Author;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

}
