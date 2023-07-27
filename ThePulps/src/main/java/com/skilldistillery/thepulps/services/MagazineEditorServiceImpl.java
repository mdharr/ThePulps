package com.skilldistillery.thepulps.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.MagazineEditor;
import com.skilldistillery.thepulps.repositories.MagazineEditorRepository;
import com.skilldistillery.thepulps.repositories.MagazineRepository;

@Service
public class MagazineEditorServiceImpl implements MagazineEditorService {
	
	@Autowired
	private MagazineEditorRepository magazineEditorRepo;
	
	@Autowired
	private MagazineRepository magazineRepo;

	@Override
	public List<MagazineEditor> getAllMagazineEditors() {
		return magazineEditorRepo.findAll();
	}

	@Override
	public List<Magazine> getAllMagazinesByMagazineEditorId(int magazineEditorId) {
		Optional<MagazineEditor> magazineEditorOptional = magazineEditorRepo.findById(magazineEditorId);
		
		if(magazineEditorOptional.isPresent()) {
			MagazineEditor magazineEditor = magazineEditorOptional.get();
			List<Magazine> magazines = new ArrayList<>();
			List<Magazine> magazineEditorMagazines = magazineEditor.getMagazines();
			for(Magazine magazineEditorMagazine : magazineEditorMagazines) {
				if(magazineEditorMagazine != null) {
					magazines.add(magazineEditorMagazine);
				}
			}
			return !magazines.isEmpty() ? magazines : null;
		}
		
		return null;
	}

	@Override
	public MagazineEditor getMagazineEditorByMagazineId(int magazineId) {
		MagazineEditor magazineEditor = magazineEditorRepo.findByMagazines_Id(magazineId);
		if(magazineEditor != null) {
			return magazineEditor;
		}
		return null;
	}

}
