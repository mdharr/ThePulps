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

class StoryPdfTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryPdf storyPdf;

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
		storyPdf = em.find(StoryPdf.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyPdf = null;
	}

	@Test
	void test_StoryPdf_entity_mapping() {
		assertNotNull(storyPdf);
		assertEquals("https://nyc3.digitaloceanspaces.com/sffaudio-usa/mp3s/RedShadowsByRobertE.HowardWT.pdf", storyPdf.getStoryUrl());
	}
	
	@Test
	void test_StoryPdf_Story_many_to_one_mapping() {
		assertNotNull(storyPdf);
		assertEquals("The Mystery of Black Jean", storyPdf.getStory().getTitle());
	}

}
