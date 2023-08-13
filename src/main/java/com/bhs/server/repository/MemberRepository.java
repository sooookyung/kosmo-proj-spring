package com.bhs.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bhs.server.domain.Member;
import java.util.List;


public interface MemberRepository extends JpaRepository<Member, String>{
    List<Member> findByEmail(String email);

}
