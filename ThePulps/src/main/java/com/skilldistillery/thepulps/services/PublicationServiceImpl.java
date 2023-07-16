package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.repositories.PublicationRepository;

public class PublicationServiceImpl implements PublicationService {
	
	@Autowired
	private PublicationRepository publicationRepo;

	@Override
	public Publication createPublication(Publication publication) {
        return publicationRepo.save(publication);
    }

	@Override
    public Publication getPublicationById(int publicationId) {
        return publicationRepo.findById(publicationId).orElse(null);
    }

	@Override
    public List<Publication> getAllPublications() {
        return publicationRepo.findAll();
    }

	@Override
    public Publication updatePublication(int publicationId, Publication publication) {
        Publication existingPublication = publicationRepo.findById(publicationId).orElse(null);
        if (existingPublication != null) {
            existingPublication.setName(publication.getName());
            existingPublication.setThumbnailUrl(publication.getThumbnailUrl());
            existingPublication.setImageUrl(publication.getImageUrl());
            // Update other properties as needed
            return publicationRepo.save(existingPublication);
        }
        return null;
    }

	@Override
    public boolean deletePublication(int publicationId) {
        Publication publication = publicationRepo.findById(publicationId).orElse(null);
        if (publication != null) {
            publicationRepo.delete(publication);
            return true;
        }
        return false;
    }

}
