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

class CoverArtistTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private CoverArtist coverArtist;
	
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
		coverArtist = em.find(CoverArtist.class, new CoverArtistId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		coverArtist = null;
	}

	@Test
	void test_CoverArtist_CoverArtwork_many_to_many_mapping() {
		assertNotNull(coverArtist);
		assertEquals("https://www.gutenberg.org/files/68957/68957-h/images/cover.jpg", coverArtist.getCoverArtwork().getImageUrl());
	}
	
	@Test
	void test_CoverArtist_Artist_many_to_many_mapping() {
		assertNotNull(coverArtist);
		assertEquals("Richard R. Epperly", coverArtist.getArtist().getName());
	}

}
