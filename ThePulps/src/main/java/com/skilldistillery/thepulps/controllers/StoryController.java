package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

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
    
//    @GetMapping("stories/{sid}/navigate-to-magazine/{mid}")
//    public ResponseEntity<String> navigateToMagazineAnchor(
//            @PathVariable("sid") int storyId,
//            @PathVariable("mid") int magazineId) {
//        String url = storyService.getStoryAnchorURL(magazineId, storyId);
//        if (url != null) {
//            HttpHeaders headers = new HttpHeaders();
//            headers.add("Location", url);
//            return new ResponseEntity<>(headers, HttpStatus.FOUND);
//        } else {
//            return new ResponseEntity<>("Story or magazine not found", HttpStatus.NOT_FOUND);
//        }
//    }
    
    @GetMapping("stories/{sid}/navigate-to-magazine/{mid}")
    public ResponseEntity<String> getStoryAnchorURL(
            @PathVariable("sid") int storyId,
            @PathVariable("mid") int magazineId) {
        String url = storyService.getStoryAnchorURL(magazineId, storyId);
        if (url != null) {
            return new ResponseEntity<>(url, HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Story or magazine not found", HttpStatus.NOT_FOUND);
        }
    }

}
