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

class MagazineTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Magazine magazine;

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
		magazine = em.find(Magazine.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazine = null;
	}

	@Test
	void test_Magazine_entity_mapping() {
		assertNotNull(magazine);
		assertEquals("Weird Tales, March 1923", magazine.getName());
	}
	
	@Test
	void test_Magazine_Publication_many_to_one_mapping() {
		assertNotNull(magazine);
		assertEquals("Weird Tales", magazine.getPublication().getName());
	}
	
	@Test
	void test_Magazine_Tag_many_to_many_mapping() {
		assertNotNull(magazine);
		assertEquals("HORROR", magazine.getTags().get(0).getGenre().toString());
	}
	
	@Test
	void test_Magazine_Story_many_to_many_mapping() {
		assertNotNull(magazine);
		assertEquals("The Mystery of Black Jean", magazine.getStories().get(0).getTitle());
	}
	
	@Test
	void test_Magazine_MagazinePdf_one_to_many_mapping() {
		assertNotNull(magazine);
		assertEquals("https://archive.org/details/WeirdTalesV01n01192303", magazine.getMagazinePdfs().get(0).getMagazineUrl());
	}
	
	@Test
	void test_Magazine_MagazineEditor_many_to_one_mapping() {
		assertNotNull(magazine);
		assertEquals("Edwin Baird", magazine.getMagazineEditor().getName());
	}

}
