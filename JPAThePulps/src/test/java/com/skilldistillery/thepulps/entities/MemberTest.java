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

class MemberTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Member member;

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
		member = em.find(Member.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		member = null;
	}

	@Test
	void test_Member_entity_mapping() {
		assertNotNull(member);
		assertEquals("Solomon Kane", member.getName());
	}
	
	@Test
	void test_Member_Story_many_to_many_mapping() {
		assertNotNull(member);
		assertEquals("The Mystery of Black Jean", member.getStories().get(0).getTitle());
	}
	
	@Test
	void test_Member_Publication_Tag_mapping() {
		assertNotNull(member);
		assertEquals("HORROR", member.getStories().get(0).getMagazines().get(0).getPublication().getTags().get(0).getGenre().toString());
	}

}
