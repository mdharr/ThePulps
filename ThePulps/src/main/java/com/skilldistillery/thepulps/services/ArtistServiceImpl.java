package com.skilldistillery.thepulps.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Artist;
import com.skilldistillery.thepulps.entities.CoverArtwork;
import com.skilldistillery.thepulps.entities.Magazine;
import com.skilldistillery.thepulps.repositories.ArtistRepository;

@Service
public class ArtistServiceImpl implements ArtistService {
	
	@Autowired
	private ArtistRepository artistRepo;

	@Override
	public List<Artist> getAllArtists() {
		return artistRepo.findAll();
	}
	
    @Override
    public List<Magazine> getAllMagazinesByArtistId(int artistId) {
        Optional<Artist> artistOptional = artistRepo.findById(artistId);
        if (artistOptional.isPresent()) {
            Artist artist = artistOptional.get();
            List<CoverArtwork> coverArtworks = artist.getCoverArtworks();
            List<Magazine> magazines = new ArrayList<>();
            for (CoverArtwork coverArtwork : coverArtworks) {
                Magazine magazine = coverArtwork.getMagazine();
                if (magazine != null) {
                    magazines.add(magazine);
                }
            }
            return magazines;
        }
        return Collections.emptyList(); // Artist with given ID not found
    }

}
