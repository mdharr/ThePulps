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
		assertEquals("https://ia803002.us.archive.org/22/items/WeirdTalesV12N02192808sasIfcIbc/Weird%20Tales%20v12%20n02%20%5B1928-08%5D%20%28sas%29%20%7B-ifc%2C%20ibc%7D.pdf", magazinePdf.getMagazineUrl());
	}
	
	@Test
	void test_MagazinePdf_Magazine_many_to_one_mapping() {
		assertNotNull(magazinePdf);
		assertEquals("Weird Tales, August 1928", magazinePdf.getMagazine().getName());
	}

}
