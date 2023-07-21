package com.skilldistillery.thepulps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.UserFollower;
import com.skilldistillery.thepulps.entities.UserFollowerId;

public interface UserFollowerRepository extends JpaRepository<UserFollower, UserFollowerId> {
	
	List<UserFollower> findAllByFollowed_Id(int userId);
	
	List<UserFollower> findAllByFollower_Id(int userId);

}
