package com.skilldistillery.thepulps.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.services.PublicationService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class PublicationController {
	
    @Autowired
    private PublicationService publicationService;

//    @PostMapping("publications")
//    public Publication createPublication(@RequestBody Publication publication, Principal principal, HttpServletResponse res, HttpServletRequest req) {
//    	Publication newPublication = null;
//    	try {
//    		newPublication = publicationService.createPublication(principal.getName(), newPublication);
//    		res.setStatus(201);
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    		res.setStatus(404);
//    	}
//    	return newPublication;
//    }

    @GetMapping("publications/{pid}")
    public Publication getPublicationById(@PathVariable("pid") int publicationId, HttpServletResponse res) {
    	if(publicationService.getPublicationById(publicationId) == null) {
    		res.setStatus(404);
    	}
    	return publicationService.getPublicationById(publicationId);
    }

    @GetMapping("publications")
    public List<Publication> getAllPublications() {
        return publicationService.getAllPublications();
    }

//    @PutMapping("publications/{pid}")
//    public ResponseEntity<Publication> updatePublication(@PathVariable("pid") int publicationId, @RequestBody Publication publication) {
//        Publication updatedPublication = publicationService.updatePublication(publicationId, publication);
//        if (updatedPublication != null) {
//            return ResponseEntity.ok(updatedPublication);
//        }
//        return ResponseEntity.notFound().build();
//    }
//
//    @DeleteMapping("publications/{pid}")
//    public ResponseEntity<Void> deletePublication(@PathVariable("pid") int publicationId) {
//        boolean deleted = publicationService.deletePublication(publicationId);
//        if (deleted) {
//            return ResponseEntity.noContent().build();
//        }
//        return ResponseEntity.notFound().build();
//    }
    
    @GetMapping("publications/{pid}/magazines")
    public List<Magazine> getAllMagazinesByPublicationId(@PathVariable("pid") int publicationId, HttpServletRequest req, HttpServletResponse res) {
    	return publicationService.getAllMagazinesByPublicationId(publicationId);
    }
    
    // url experiment
    @GetMapping("publications/items/{fpn}")
    public Publication getPublicationByName(@PathVariable("fpn") String formattedPublicationName, HttpServletResponse res) {
    	String originalName = formattedPublicationName.replace("-", " ");
    	if(publicationService.getPublicationByName(originalName) == null) {
    		res.setStatus(404);
    	}
    	return publicationService.getPublicationByName(originalName);
    }

}
