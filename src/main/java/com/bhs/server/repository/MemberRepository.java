package com.bhs.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bhs.server.domain.Member;


public interface MemberRepository extends JpaRepository<Member, String>{
    Member findByEmail(String email);
}
