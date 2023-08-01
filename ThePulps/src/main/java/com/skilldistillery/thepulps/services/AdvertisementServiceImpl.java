package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Advertisement;
import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.repositories.AdvertisementRepository;
import com.skilldistillery.thepulps.repositories.MagazineRepository;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
	
	@Autowired
	private AdvertisementRepository advertisementRepo;
	
	@Autowired
	private MagazineRepository magazineRepo;

	@Override
	public List<Advertisement> getAllAdvertisements() {
		return advertisementRepo.findAll();
	}

	@Override
	public List<Advertisement> getAllAdvertisementsByMagazineId(int magazineId) {
		Optional<Magazine> magazineOptional = magazineRepo.findById(magazineId);
		if(magazineOptional.isPresent()) {
			Magazine magazine = magazineOptional.get();
			List<Advertisement> advertisements = magazine.getAdvertisements();
			return advertisements;
		}
		return null;
	}

}
