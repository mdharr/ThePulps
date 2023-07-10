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

class StoryAuthorTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryAuthor storyAuthor;
	
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
		storyAuthor = em.find(StoryAuthor.class, new StoryAuthorId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyAuthor = null;
	}

	@Test
	void test_StoryAuthor_Author_many_to_many_mapping() {
		assertNotNull(storyAuthor);
		assertEquals("Robert E. Howard", storyAuthor.getAuthor().getFullName());
	}
	
	@Test
	void test_StoryAuthor_Story_many_to_many_mapping() {
		assertNotNull(storyAuthor);
		assertEquals("Red Shadows", storyAuthor.getStory().getTitle());
	}
	
	@Test
	void test_StoryAuthor_StoryPdf_mapping() {
		assertNotNull(storyAuthor);
		assertEquals("https://nyc3.digitaloceanspaces.com/sffaudio-usa/mp3s/RedShadowsByRobertE.HowardWT.pdf", storyAuthor.getStory().getStoryPdfs().get(0).getStoryUrl());
	}

}
