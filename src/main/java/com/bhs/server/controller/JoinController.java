package com.bhs.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JoinController {
    @GetMapping("join.do")
    public String join() {
        return "join";
    }

    @PostMapping("join.do")
    public String doJoin() {
        return "redirect:index.do";
    }
}
