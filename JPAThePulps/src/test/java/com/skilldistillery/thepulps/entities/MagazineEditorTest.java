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

class MagazineEditorTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MagazineEditor magazineEditor;

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
		magazineEditor = em.find(MagazineEditor.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		magazineEditor = null;
	}

	@Test
	void test_MagazineEditor_entity_mapping() {
		assertNotNull(magazineEditor);
		assertEquals("Edwin Baird", magazineEditor.getName());
	}
	
	@Test
	void test_MagazineEditor_Magazine_one_to_many_mapping() {
		assertNotNull(magazineEditor);
		assertEquals("Weird Tales, March 1923", magazineEditor.getMagazines().get(0).getName());
	}

}
