package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Magazine;

public interface MagazineService {
	
//	public Publication createPublication(Publication publication);

    public Magazine getMagazineById(int magazineId);

    public List<Magazine> getAllMagazines();

//    public Publication updatePublication(int publicationId, Publication publication);

//    public boolean deletePublication(int publicationId);

}
