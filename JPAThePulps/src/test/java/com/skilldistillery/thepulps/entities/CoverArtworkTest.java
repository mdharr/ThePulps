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
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/f/ff/Weird_Tales_March_1923.jpg", coverArtwork.getImageUrl());
	}
	
	@Test
	void test_CoverArtwork_Magazine_one_to_one_mapping() {
		assertNotNull(coverArtwork);
		assertEquals("Weird Tales, March 1923", coverArtwork.getMagazine().getName());
	}

}
