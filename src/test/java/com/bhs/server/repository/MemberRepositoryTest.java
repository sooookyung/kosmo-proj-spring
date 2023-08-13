package com.bhs.server.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.bhs.server.domain.Member;

@SpringBootTest
public class MemberRepositoryTest {
    @Autowired
    private MemberRepository memberRepository;

    @Test
    void testFindByEmail() {
    }

    @Test
    void testFindById() {
        Member member = memberRepository.findById("bhs123@bhs.com").orElseThrow();
        System.out.print(member);
    }
}
