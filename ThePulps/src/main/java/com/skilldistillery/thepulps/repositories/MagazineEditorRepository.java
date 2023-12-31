package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.MagazineEditor;

public interface MagazineEditorRepository extends JpaRepository<MagazineEditor, Integer> {
	
	MagazineEditor findByMagazines_Id(int magazineId);	
}
