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

class UserFollowerTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private UserFollower userFollower;
	
	private UserFollowerId userFollowerId;

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
		userFollowerId = new UserFollowerId(2, 3); // Example ID values
		userFollower = em.find(UserFollower.class, userFollowerId);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userFollowerId = null;
		userFollower = null;
	}
	
    @Test
    void test_UserFollower_entity_mapping() {
        assertNotNull(userFollower);
        assertNotNull(userFollower.getFollower());
        assertNotNull(userFollower.getFollowed());
        assertEquals("Solomon", userFollower.getFollower().getUsername());
        assertEquals("Conan", userFollower.getFollowed().getUsername());
    }

}
