package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Advertisement;

public interface AdvertisementRepository extends JpaRepository<Advertisement, Integer> {

}
