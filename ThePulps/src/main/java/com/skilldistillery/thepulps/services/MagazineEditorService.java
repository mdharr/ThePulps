package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.MagazineEditor;

public interface MagazineEditorService {
	
	List<MagazineEditor> getAllMagazineEditors();
	
	List<Magazine> getAllMagazinesByMagazineEditorId(int magazineEditorId);
	
	MagazineEditor getMagazineEditorByMagazineId(int magazineId);

}
