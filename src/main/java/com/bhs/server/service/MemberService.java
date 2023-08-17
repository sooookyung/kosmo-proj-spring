package com.bhs.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bhs.server.domain.Member;
import com.bhs.server.repository.MemberRepository;

@Service
public class MemberService {
    @Autowired
    private MemberRepository repository;

    public void add(Member member) {
        repository.save(member);
    }

    public Member checkPassword(String email, String pwd) {
        Member member = repository.findByEmail(email);
        if (member == null || !member.getPwd().equals(pwd)) {
            return null;
        } else {
            return member;
        }
    }
}
