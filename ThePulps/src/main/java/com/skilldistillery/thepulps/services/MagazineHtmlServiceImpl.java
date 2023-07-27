package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.MagazineHtml;
import com.skilldistillery.thepulps.repositories.MagazineHtmlRepository;
import com.skilldistillery.thepulps.repositories.MagazineRepository;

@Service
public class MagazineHtmlServiceImpl implements MagazineHtmlService {
	
	@Autowired
	private MagazineHtmlRepository magazineHtmlRepo;

	@Override
	public List<MagazineHtml> getAllMagazineHtmls() {
		return magazineHtmlRepo.findAll();
	}

	@Override
	public MagazineHtml getMagazineHtmlByMagazineId(int magazineId) {
		MagazineHtml magazineHtml = magazineHtmlRepo.findByMagazineId(magazineId);
		if(magazineHtml != null) {
			return magazineHtml;
		}
		return null;
	}

}
