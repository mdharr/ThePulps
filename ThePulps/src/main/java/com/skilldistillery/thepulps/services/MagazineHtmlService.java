package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.MagazineHtml;

public interface MagazineHtmlService {
	
	public List<MagazineHtml> getAllMagazineHtmls();
	
	public MagazineHtml getMagazineHtmlById(int magazineHtmlId);
	
	public MagazineHtml getMagazineHtmlByMagazineId(int magazineId);

}
