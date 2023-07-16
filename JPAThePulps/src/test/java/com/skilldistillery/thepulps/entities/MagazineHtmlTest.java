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

class MagazineHtmlTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MagazineHtml magazineHtml;

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
		magazineHtml = em.find(MagazineHtml.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazineHtml = null;
	}

	@Test
	void test_MagazineHtml_entity_mapping() {
		assertNotNull(magazineHtml);
		assertEquals("https://www.gutenberg.org/files/68957/68957-h/68957-h.htm", magazineHtml.getFileUrl());
	}
	
	@Test
	void test_MagazineHtml_Magazine_one_to_one_mapping() {
		assertNotNull(magazineHtml);
		assertEquals("Weird Tales, August 1928", magazineHtml.getMagazine().getName());
	}
	
	@Test
	void test_MagazineHtml_StoryAnchor_one_to_many_mapping() {
		assertNotNull(magazineHtml);
		assertEquals("RED_SHADOWS", magazineHtml.getStoryAnchors().get(0).getAnchorTag());
	}
	
	@Test
	void test_MagazineHtml_Story_many_to_many_mapping() {
		assertNotNull(magazineHtml);
		assertEquals("Red Shadows", magazineHtml.getStories().get(0).getTitle());
	}

}
