package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Collection;

public interface CollectionRepository extends JpaRepository<Collection, Integer> {

}
