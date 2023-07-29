package com.skilldistillery.thepulps.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Author;
import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.repositories.MagazineRepository;
import com.skilldistillery.thepulps.repositories.PublicationRepository;
import com.skilldistillery.thepulps.repositories.StoryRepository;

@Service
public class MagazineServiceImpl implements MagazineService {
	
	@Autowired
	private MagazineRepository magazineRepo;
	
	@Autowired
	private StoryRepository storyRepo;
	
	@Autowired
	private PublicationRepository publicationRepo;

	@Override
	public List<Magazine> getAllMagazines() {
		return magazineRepo.findAll();
	}
	
	@Override
    public Magazine getMagazineById(int magazineId) {
        return magazineRepo.findById(magazineId).orElse(null);
    }

	@Override
	public List<Story> getAllStoriesByMagazineId(int magazineId) {
		Optional<Magazine> magazineOptional = magazineRepo.findById(magazineId);
		if(magazineOptional.isPresent()) {
			Magazine magazine = magazineOptional.get();
			List<Story> stories = new ArrayList<>();
			List<Story> magazineStories = magazine.getStories();
			for(Story magazineStory : magazineStories) {
				if (magazineStory != null) {
					stories.add(magazineStory);
				}
			}
			return stories;
		}
		return Collections.emptyList();
	}

	@Override
	public Magazine getMagazineByStoryId(int storyId) {
		Optional<Story> storyOptional = storyRepo.findById(storyId);
		if(storyOptional.isPresent()) {
			Story story = storyOptional.get();
			Magazine magazine = story.getMagazines().get(0);
			return magazine;
		}
		return null;
	}

	@Override
	public List<Magazine> getByPublicationId(int publicationId) {
		Optional<Publication> publicationOptional = publicationRepo.findById(publicationId);
		if(publicationOptional.isPresent()) {
			Publication publication = publicationOptional.get();
			List<Magazine> magazines = publication.getMagazines();
			return magazines;
		}
		return null;
	}

}
