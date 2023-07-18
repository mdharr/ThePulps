package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Tag;

public interface TagRepository extends JpaRepository<Tag, Integer> {

}
