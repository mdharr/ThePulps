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

class MagazineTagTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MagazineTag magazineTag;
	
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
		magazineTag = em.find(MagazineTag.class, new MagazineTagId(1, 2));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazineTag = null;
	}

	@Test
	void test_MagazineTag_Magazine_many_to_many_mapping() {
		assertNotNull(magazineTag);
		assertEquals("Weird Tales, March 1923", magazineTag.getMagazine().getName());
	}
	
	@Test
	void test_MagazineTag_Tag_many_to_many_mapping() {
		assertNotNull(magazineTag);
		assertEquals("HORROR", magazineTag.getTag().getGenre().toString());
	}

}
