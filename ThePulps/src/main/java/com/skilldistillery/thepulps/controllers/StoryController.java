package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Story;
import com.skilldistillery.thepulps.services.StoryService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class StoryController {
	
	@Autowired
	private StoryService storyService;
	
    @GetMapping("stories")
    public List<Story> getAllStories() {
        return storyService.getAllStories();
    }
    
    @GetMapping("stories/{sid}")
    public Story getStoryById(@PathVariable("sid") int storyId, HttpServletResponse res) {
    	if(storyService.getStoryById(storyId) == null) {
    		res.setStatus(404);
    	}
    	return storyService.getStoryById(storyId);
    }

}
