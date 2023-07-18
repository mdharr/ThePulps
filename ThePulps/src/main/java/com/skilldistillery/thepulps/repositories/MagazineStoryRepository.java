package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.MagazineStory;

public interface MagazineStoryRepository extends JpaRepository<MagazineStory, Integer> {

}
