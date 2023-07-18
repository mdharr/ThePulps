package com.skilldistillery.thepulps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.thepulps.entities.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {

}
