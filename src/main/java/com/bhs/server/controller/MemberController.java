package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bhs.server.domain.Member;
import com.bhs.server.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    private MemberService service;
    
    @PostMapping("login.do")
    public String doLogin(@RequestParam("login-email") String email, @RequestParam("login-pwd") String pwd, HttpSession session) {
        Member result = service.checkPassword(email, pwd);
        if (result == null) {
            return "login_error";
        } else {
            session.setAttribute("nickname", result.getNickname());
            return "redirect:index.do";
        }
    }

    @GetMapping("logout.do")
    public String doLogout(HttpSession session) {
        session.invalidate();
        return "redirect:index.do";
    }
}
