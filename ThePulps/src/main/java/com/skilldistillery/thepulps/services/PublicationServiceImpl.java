package com.skilldistillery.thepulps.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.repositories.PublicationRepository;
import com.skilldistillery.thepulps.repositories.UserRepository;

@Service
public class PublicationServiceImpl implements PublicationService {
	
	@Autowired
	private PublicationRepository publicationRepo;
	
	@Autowired
	private UserRepository userRepo;

//	@Override
//	public Publication createPublication(String username, Publication publication) {
//		Publication newPublication = null;
//		User user = null;
//		User userOpt = userRepo.findByUsername(username);
//		if(userOpt != null) {
//			user = userOpt;
//			publication.setUser(user);
//			newPublication = publicationRepo.saveAndFlush(publication);
//		}
//        return newPublication;
//    }

	@Override
    public Publication getPublicationById(int publicationId) {
//        return publicationRepo.findById(publicationId).orElse(null);
		Publication publication = null;
		Optional<Publication> publicationOpt = publicationRepo.findById(publicationId);
		if(publicationOpt.isPresent()) {
			publication = publicationOpt.get();
		}
		return publication;
    }

	@Override
    public List<Publication> getAllPublications() {
        return publicationRepo.findAll();
    }
//
//	@Override
//    public Publication updatePublication(int publicationId, Publication publication) {
//        Publication existingPublication = publicationRepo.findById(publicationId).orElse(null);
//        if (existingPublication != null) {
//            existingPublication.setName(publication.getName());
//            existingPublication.setThumbnailUrl(publication.getThumbnailUrl());
//            existingPublication.setImageUrl(publication.getImageUrl());
//            // Update other properties as needed
//            return publicationRepo.save(existingPublication);
//        }
//        return null;
//    }
//
//	@Override
//    public boolean deletePublication(int publicationId) {
//        Publication publication = publicationRepo.findById(publicationId).orElse(null);
//        if (publication != null) {
//            publicationRepo.delete(publication);
//            return true;
//        }
//        return false;
//    }

	@Override
	public List<Magazine> getAllMagazinesByPublicationId(int publicationId) {
		Optional<Publication> publicationOptional = publicationRepo.findById(publicationId);
		if(publicationOptional.isPresent()) {
			Publication publication = publicationOptional.get();
			List<Magazine> magazines = new ArrayList<>();
			List<Magazine> publicationMagazines = publication.getMagazines();
			for(Magazine publicationMagazine : publicationMagazines) {
				if(publicationMagazine != null) {
					magazines.add(publicationMagazine);
				}
			}
			return magazines;
		}
		return Collections.emptyList();
	}

	@Override
	public Publication getPublicationByName(String publicationName) {
		return publicationRepo.findByName(publicationName);
	}

}
