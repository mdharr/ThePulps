package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Artist;

public interface ArtistRepository extends JpaRepository<Artist, Integer> {

}
