package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.MemberGroup;

public interface MemberGroupRepository extends JpaRepository<MemberGroup, Integer> {

}
