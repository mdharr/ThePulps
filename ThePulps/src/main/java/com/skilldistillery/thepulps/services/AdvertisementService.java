package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Advertisement;

public interface AdvertisementService {
	
	List<Advertisement> getAllAdvertisements();
	
	List<Advertisement> getAllAdvertisementsByMagazineId(int magazineId);

}
