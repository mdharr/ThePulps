package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.repositories.MagazineRepository;

@Service
public class MagazineServiceImpl implements MagazineService {
	
	@Autowired
	private MagazineRepository magazineRepo;

	@Override
	public List<Magazine> getAllMagazines() {
		return magazineRepo.findAll();
	}
	
	@Override
    public Magazine getMagazineById(int magazineId) {
        return magazineRepo.findById(magazineId).orElse(null);
    }

}
