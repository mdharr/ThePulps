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

class AdvertisementTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Advertisement advertisement;

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
		advertisement = em.find(Advertisement.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		advertisement = null;
	}

	@Test
	void test_Advertisement_entity_mapping() {
		assertNotNull(advertisement);
		assertEquals("https://www.gutenberg.org/files/69607/69607-h/images/ad01.jpg", advertisement.getImageUrl());
	}
	
	@Test
	void test_Advertisement_Magazine_one_to_many_mapping() {
		assertNotNull(advertisement);
		assertEquals("Weird Tales, March 1923", advertisement.getMagazine().getName());
	}

}
