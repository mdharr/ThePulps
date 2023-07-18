package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.PublicationTag;

public interface PublicationTagRepository extends JpaRepository<PublicationTag, Integer> {

}
