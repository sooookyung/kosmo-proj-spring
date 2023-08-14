package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bhs.server.domain.Member;
import com.bhs.server.service.MemberService;

@Controller
public class JoinController {
    @Autowired
    private MemberService service;
    
    @GetMapping("join.do")
    public String join() {
        return "join";
    }

    @PostMapping("join.do")
    public String doJoin(Member member) {
        service.add(member);
        return "redirect:index.do";
    }
}
