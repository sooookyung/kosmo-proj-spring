package com.bhs.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @GetMapping("/list.do")
    public String board() {
        return "list";
    }

    @GetMapping("/write.do")
    public String write() {
        return "write";
    }

    @GetMapping("list.do")
    public String list() {
        return "list";
    }
}
