package com.skilldistillery.thepulps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.UserFollower;

public interface UserFollowerRepository extends JpaRepository<UserFollower, Integer> {
	
	List<UserFollower> findAllByFollowed_Id(int userId);
	
	List<UserFollower> findAllByFollower_Id(int userId);

}
