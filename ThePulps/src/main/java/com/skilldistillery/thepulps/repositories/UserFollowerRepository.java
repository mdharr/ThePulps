package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.UserFollower;

public interface UserFollowerRepository extends JpaRepository<UserFollower, Integer> {

}
