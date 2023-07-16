package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Publication;

public interface PublicationRepository extends JpaRepository<Publication, Integer> {

}
