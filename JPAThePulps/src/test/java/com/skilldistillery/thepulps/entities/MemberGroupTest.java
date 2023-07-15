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

class MemberGroupTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private MemberGroup memberGroup;

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
		memberGroup = em.find(MemberGroup.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		memberGroup = null;
	}

	@Test
	void test_MemberGroup_entity_mapping() {
		assertNotNull(memberGroup);
		assertEquals("Robert E. Howard Club", memberGroup.getName());
	}
	
	@Test
	void test_MemberGroup_User_many_to_one_mapping() {
		assertNotNull(memberGroup);
		assertEquals("Solomon", memberGroup.getUser().getUsername());
	}

}
