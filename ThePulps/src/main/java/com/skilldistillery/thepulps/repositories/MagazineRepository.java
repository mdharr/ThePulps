package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Magazine;

public interface MagazineRepository extends JpaRepository<Magazine, Integer> {

}
