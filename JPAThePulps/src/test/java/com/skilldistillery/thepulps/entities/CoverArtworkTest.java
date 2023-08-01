package com.skilldistillery.thepulps.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CoverArtworkTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private CoverArtwork coverArtwork;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAThePulps");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		coverArtwork = em.find(CoverArtwork.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		coverArtwork = null;
	}

	@Test
	void test_CoverArtwork_entity_mapping() {
		assertNotNull(coverArtwork);
		assertEquals("https://ia800908.us.archive.org/BookReader/BookReaderImages.php?zip=/33/items/WeirdTalesV01n01192303/Weird%20Tales%20v01n01%20%281923-03%29_jp2.zip&file=Weird%20Tales%20v01n01%20%281923-03%29_jp2/Weird%20Tales%20v01n01%20%281923-03%29_0000.jp2&id=WeirdTalesV01n01192303&scale=2&rotate=0", coverArtwork.getImageUrl());
	}
	
	@Test
	void test_CoverArtwork_Magazine_one_to_one_mapping() {
		assertNotNull(coverArtwork);
		assertEquals("Weird Tales, March 1923", coverArtwork.getMagazine().getName());
	}
	
	@Test
	void test_CoverArtwork_Artist_many_to_many_mapping() {
		assertNotNull(coverArtwork);
		assertEquals("Richard R. Epperly", coverArtwork.getArtists().get(0).getName());
	}

}
