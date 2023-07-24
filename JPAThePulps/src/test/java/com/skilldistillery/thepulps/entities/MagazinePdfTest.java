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

class MagazinePdfTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MagazinePdf magazinePdf;

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
		magazinePdf = em.find(MagazinePdf.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazinePdf = null;
	}

	@Test
	void test_MagazinePdf_entity_mapping() {
		assertNotNull(magazinePdf);
		assertEquals("https://archive.org/details/WeirdTalesV01n01192303", magazinePdf.getMagazineUrl());
	}
	
	@Test
	void test_MagazinePdf_Magazine_many_to_one_mapping() {
		assertNotNull(magazinePdf);
		assertEquals("Weird Tales, March 1923", magazinePdf.getMagazine().getName());
	}

}
