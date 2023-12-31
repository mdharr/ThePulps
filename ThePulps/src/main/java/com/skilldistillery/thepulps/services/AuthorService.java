package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.Author;
import com.skilldistillery.thepulps.entities.Story;

public interface AuthorService {

//	public Publication createPublication(Publication publication);

    public Author getAuthorById(int authorId);

    public List<Author> getAllAuthors();

//    public Publication updatePublication(int publicationId, Publication publication);

//    public boolean deletePublication(int publicationId);
    
    public List<Story> getAllStoriesByAuthorId(int authorId);


}
