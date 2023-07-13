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

class UserProfileTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private UserProfile userProfile;

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
		userProfile = em.find(UserProfile.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userProfile = null;
	}

	@Test
	void test_UserProfile_entity_mapping() {
		assertNotNull(userProfile);
		assertEquals("A somber-looking man who wanders the world with no apparent goal other than to vanquish evil in all its forms.", userProfile.getBio());
	}
	
	@Test
	void test_UserProfile_User_one_to_one_mapping() {
		assertNotNull(userProfile);
		assertEquals("Solomon", userProfile.getUser().getUsername());
	}

}
