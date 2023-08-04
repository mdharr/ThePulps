package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.Publication;

public interface PublicationService {
	
//	public Publication createPublication(String username, Publication publication);

    public Publication getPublicationById(int publicationId);

    public List<Publication> getAllPublications();
//
//    public Publication updatePublication(int publicationId, Publication publication);
//
//    public boolean deletePublication(int publicationId);
    
    public List<Magazine> getAllMagazinesByPublicationId(int publicationId);
    
    // url experiment stretch goal
    public Publication getPublicationByName(String publicationName);

	
}
