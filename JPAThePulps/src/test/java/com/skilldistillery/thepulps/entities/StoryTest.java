package com.skilldistillery.thepulps.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

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
	void test_Story_entity_mapping() {
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
	
	@Test
	void test_Story_Collection_many_to_many_mapping_v2() {
		assertNotNull(story);
		assertEquals("admin", story.getCollections().get(0).getUser().getUsername());
	}
	
	@Test
	void test_Story_Member_many_to_many_mapping() {
		assertNotNull(story);
		assertEquals("Solomon Kane", story.getMembers().get(0).getName());
	}
	
	@Test
	void test_Story_StoryComment_one_to_many_mapping_v2() {
	    assertNotNull(story);
	    assertEquals("Slowly he rose, mechanically wiping his hands upon his cloak. A dark scowl had settled on his somber brow. Yet he made no wild, reckless vow, swore no oath by saints or devils.", story.getStoryComments().get(0).getParentComment().getContent());
	}

}
