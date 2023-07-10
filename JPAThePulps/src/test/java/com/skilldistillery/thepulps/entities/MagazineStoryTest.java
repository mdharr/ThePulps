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

class MagazineStoryTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MagazineStory magazineStory;
	
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
		magazineStory = em.find(MagazineStory.class, new MagazineStoryId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazineStory = null;
	}

	@Test
	void test_CoverArtwork_entity_mapping() {
		assertNotNull(magazineStory);
		assertEquals("Weird Tales, August 1928", magazineStory.getMagazine().getName());
	}
	
	@Test
	void test_Story_StoryPdf_one_to_many_mapping() {
		assertNotNull(magazineStory);
		assertEquals("Red Shadows", magazineStory.getStory().getTitle());
	}

}
