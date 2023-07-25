package com.skilldistillery.thepulps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skilldistillery.thepulps.entities.Collection;

public interface CollectionRepository extends JpaRepository<Collection, Integer> {
	
	List<Collection> findByUserId(int userId);
	
    @Query("SELECT c FROM Collection c WHERE c.id = :collectionId AND c.user.username = :username")
    Collection findByIdAndUser_Username(@Param("collectionId") Integer collectionId, @Param("username") String username);

}
