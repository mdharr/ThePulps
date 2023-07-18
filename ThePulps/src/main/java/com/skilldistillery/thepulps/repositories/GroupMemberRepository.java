package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.GroupMember;

public interface GroupMemberRepository extends JpaRepository<GroupMember, Integer> {

}
