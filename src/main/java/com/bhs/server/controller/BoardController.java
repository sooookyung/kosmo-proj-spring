package com.bhs.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
    @GetMapping("board.do")
    public String board() {
        return "board";
    }

    @GetMapping("write.do")
    public String write() {
        return "write";
    }
}
