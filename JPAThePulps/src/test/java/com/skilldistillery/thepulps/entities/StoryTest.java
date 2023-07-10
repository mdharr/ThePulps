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

class StoryTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Story story;

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
		story = em.find(Story.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		story = null;
	}

	@Test
	void test_CoverArtwork_entity_mapping() {
		assertNotNull(story);
		assertEquals("Red Shadows", story.getTitle());
	}
	
	@Test
	void test_Story_StoryPdf_one_to_many_mapping() {
		assertNotNull(story);
		assertEquals("https://nyc3.digitaloceanspaces.com/sffaudio-usa/mp3s/RedShadowsByRobertE.HowardWT.pdf", story.getStoryPdfs().get(0).getStoryUrl());
	}
	
	@Test
	void test_Story_Author_many_to_many_mapping() {
		assertNotNull(story);
		assertEquals("Robert E. Howard", story.getAuthors().get(0).getFullName());
	}
	
	@Test
	void test_Story_Tag_many_to_many_mapping() {
		assertNotNull(story);
		assertEquals("HORROR", story.getTags().get(0).getGenre().toString());
	}

}
