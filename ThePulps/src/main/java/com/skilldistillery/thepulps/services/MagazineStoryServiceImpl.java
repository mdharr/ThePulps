package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.MagazineStory;
import com.skilldistillery.thepulps.repositories.MagazineStoryRepository;

@Service
public class MagazineStoryServiceImpl implements MagazineStoryService {
	
	@Autowired
	private MagazineStoryRepository magazineStoryRepo;

	@Override
	public List<MagazineStory> getAllMagazineStories() {
		return magazineStoryRepo.findAll();
	}

}
