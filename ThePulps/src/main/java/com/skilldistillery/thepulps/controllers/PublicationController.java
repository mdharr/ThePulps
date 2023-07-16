package com.skilldistillery.thepulps.controllers;

import java.util.List;

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

import com.skilldistillery.thepulps.entities.Publication;
import com.skilldistillery.thepulps.services.PublicationService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class PublicationController {
	
    @Autowired
    private PublicationService publicationService;

//    @PostMapping("publications")
//    public ResponseEntity<Publication> createPublication(@RequestBody Publication publication) {
//        Publication createdPublication = publicationService.createPublication(publication);
//        if (createdPublication != null) {
//            return ResponseEntity.status(HttpStatus.CREATED).body(createdPublication);
//        }
//        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//    }
//
//    @GetMapping("publications/{pid}")
//    public ResponseEntity<Publication> getPublicationById(@PathVariable("pid") int publicationId) {
//        Publication publication = publicationService.getPublicationById(publicationId);
//        if (publication != null) {
//            return ResponseEntity.ok(publication);
//        }
//        return ResponseEntity.notFound().build();
//    }

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

}
