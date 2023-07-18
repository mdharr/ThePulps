package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.MagazineTag;
import com.skilldistillery.thepulps.repositories.MagazineTagRepository;

@Service
public class MagazineTagServiceImpl implements MagazineTagService {
	
	@Autowired
	private MagazineTagRepository magazineTagRepo;

	@Override
	public List<MagazineTag> getAllMagazineTags() {
		return magazineTagRepo.findAll();
	}

}
