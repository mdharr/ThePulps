package com.skilldistillery.thepulps.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Author;
import com.skilldistillery.thepulps.entities.MagazineHtml;
import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.entities.StoryAnchor;
import com.skilldistillery.thepulps.repositories.MagazineHtmlRepository;
import com.skilldistillery.thepulps.repositories.StoryAnchorRepository;
import com.skilldistillery.thepulps.repositories.StoryRepository;

@Service
public class StoryServiceImpl implements StoryService {
	
	@Autowired
	private StoryRepository storyRepo;
	
	@Autowired
	private MagazineHtmlRepository magazineHtmlRepo;
	
	@Autowired
	private StoryAnchorRepository storyAnchorRepo;

	@Override
	public List<Story> getAllStories() {
		return storyRepo.findAll();
	}

	@Override
	public Story getStoryById(int storyId) {
//		return storyRepo.findById(storyId).orElse(null);
		Story story = null;
		Optional<Story> storyOpt = storyRepo.findById(storyId);
		if(storyOpt.isPresent()) {
			story = storyOpt.get();
		}
		return story;
	}
	
	@Override
	public List<Author> getAuthorsByStoryId(int storyId) {
		Optional<Story> storyOptional = storyRepo.findById(storyId);
		if(storyOptional.isPresent()) {
			Story story = storyOptional.get();
			List<Author> storyAuthors = story.getAuthors();
			List<Author> authors = new ArrayList<>();
			for (Author author : storyAuthors) {
				if(author != null) {
					authors.add(author);
				}
			}
			return authors;

		}
		return null;
	}
	
    @Override
    public String getStoryAnchorURL(int magazineId, int storyId) {
        MagazineHtml magazineHtml = magazineHtmlRepo.findByMagazineId(magazineId);
        if (magazineHtml != null) {
            StoryAnchor storyAnchor = storyAnchorRepo.findByStoryIdAndMagazineHtml(storyId, magazineHtml);
            if (storyAnchor != null) {
                return magazineHtml.getFileUrl() + "#" + storyAnchor.getAnchorTag();
            }
        }
        return null; // Handle case when magazine or anchor not found
    }


}
